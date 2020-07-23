--1 For each company, how many job applicants have been placed by the agency at that company
select companyname, CompanyContactName, count(APPLIEDJOBS.ApplicationID) as [TotalPlaced] from COMPANY
inner join JOBPOSTING on COMPANY.CompanyID = JOBPOSTING.CompanyID inner join APPLIEDJOBS
on JOBPOSTING.JobPostingID = APPLIEDJOBS.JobPostingID
group by companyname, CompanyContactName

--2 For each applicant, list the name of the applicant and the jobs he has applied for and the date of the application related to that job application.
select AFName, ALName, Jobdescription from APPLICANT inner join WORKEXPERIENCE on
APPLICANT.ApplicantID = WORKEXPERIENCE.ApplicantID inner join job on
WORKEXPERIENCE.JobID = job.JobID

--3 For each skill, list the name of the skills and number of years required, the applicant id and name and cell phone number of the applicant that has that many years of that skill
select skilldescription, APPLICANT.ApplicantID, afname, alname, phonenum, YearsExperince from APPLICANT
inner join APPLICANTSKILLS on APPLICANT.ApplicantID = APPLICANTSKILLS.ApplicantID inner join
SKILLS on APPLICANTSKILLS.SkillID = SKILLS.SkillID

--4 For each company, list how many job postings have been received.
select companyname, count(JOBPOSTING.JobPostingID) as [TotalReceived] from COMPANY inner join
JOBPOSTING on COMPANY.CompanyID = JOBPOSTING.CompanyID
group by CompanyName

--5 List the name of the company from which the most job postings have been received.
select companyname, count(JOBPOSTING.JobPostingID) as [TotalReceived] from COMPANY inner join
JOBPOSTING on COMPANY.CompanyID = JOBPOSTING.CompanyID
group by CompanyName 
having count(JOBPOSTING.JobPostingID) in (select max([TotalReceived]) from 
(select count(JOBPOSTING.JobPostingID) as [TotalReceived] from COMPANY inner join
JOBPOSTING on COMPANY.CompanyID = JOBPOSTING.CompanyID group by CompanyName) 
as [TotalReceivedd])

--6 List the name of the applicant who currently has the most skills
select afname,alname,count(SkillID) as [SkillNumber] from APPLICANT inner join APPLICANTSKILLS
on APPLICANT.ApplicantID = APPLICANTSKILLS.ApplicantID
group by AFName, ALName having count(SkillID) in(select max (most) from
(select count(SkillID) as [most] from APPLICANTSKILLS group by ApplicantID) as Mst)

--7 For each job posting, list the names of the applicants that have some of the skills required by the job
select JobPostingID, afname, alname, skilldescription from APPLICANT inner join APPLICANTSKILLS
on APPLICANT.ApplicantID = APPLICANTSKILLS.ApplicantID inner join SKILLS on	
APPLICANTSKILLS.SkillID = SKILLS.SkillID inner join REQUIREDSKILL on
SKILLS.SkillID = REQUIREDSKILL.SkillID

--8 For each job posting, list the names of the applicants that have all the skills required by the job
select  JOBPOSTING.JobPostingID,APPLICANT.ApplicantID
from JOBPOSTING 
inner join REQUIREDSKILL on JOBPOSTING.JobPostingID=REQUIREDSKILL.JobPostingID
inner join SKILLS on REQUIREDSKILL.SkillID=SKILLS.SkillID 
inner join APPLICANTSKILLS on SKILLS.SkillID=APPLICANTSKILLS.SkillID 
inner join APPLICANT on APPLICANTSKILLS.ApplicantID=APPLICANT.ApplicantID

--9 For each applicant, list the job posting ID of each job for which he has some of the skills
select afname, alname,JobPostingID, SkillDescription from APPLICANT inner join APPLICANTSKILLS
on APPLICANT.ApplicantID = APPLICANTSKILLS.ApplicantID inner join SKILLS on	
APPLICANTSKILLS.SkillID = SKILLS.SkillID inner join REQUIREDSKILL on
SKILLS.SkillID = REQUIREDSKILL.SkillID

--10 List the name of each applicant that has been hired
select afname, alname, washired from APPLICANT inner join  APPLICATION on
APPLICANT.ApplicantID = APPLICATION.ApplicantID
where WasHired is not null

--11 Which applicant has indicated the highest salary requirement
select afname,alname,max(salaryrate) as [max] from APPLICANT inner join WORKEXPERIENCE on 
APPLICANT.ApplicantID = WORKEXPERIENCE.ApplicantID inner join job on
WORKEXPERIENCE.JobID = JOB.JobID inner join JOBPOSTING on
job.JobID = JOBPOSTING.JobID group by afname,alname having max(salaryrate)
in (select max(MaxSalaryRate) from
(select max(salaryrate) as MaxSalaryRate from APPLICANT inner join WORKEXPERIENCE on 
APPLICANT.ApplicantID = WORKEXPERIENCE.ApplicantID inner join job on
WORKEXPERIENCE.JobID = JOB.JobID inner join JOBPOSTING on
job.JobID = JOBPOSTING.JobID group by afname,alname) as MxSalaryRate) 

--12 List the names of each full-time job that has been posted and not yet filled
select jobdescription,Jobposting.JobPostingID,JobType
from JOB 
inner join JOBPOSTING on JOB.JobID=JOBPOSTING.JobID
where Jobposting.JobPostingID not in(select JobPostingID from APPLIEDJOBS)

select jobdescription
from JOB 
inner join JOBPOSTING on JOB.JobID=JOBPOSTING.JobID
where Jobposting.JobPostingID not in(select JobPostingID from APPLIEDJOBS)

--13 For each job posting, list the number of skills that are required for the job posting
select JobPostingID, count(SkillID) as [totalskill] from REQUIREDSKILL
group by JobPostingID

--14 List each job posted and the date it was posted of all jobs posted during the year 2018.
select JobPosting,dateposted from APPLICATION where DatePosted like '2018%' 

--15 For each job posted in year 2018, list the name of each applicant that has been recommended for the job.
select JobPosting, afname,alname,AgentID from APPLICATION inner join APPLICANT on 
APPLICATION.ApplicantID = APPLICANT.ApplicantID where DatePosted like '2018%'

--16 List each job posting whose salary is between 30000 – 70000
select JobPostingID,salaryrate from JOBPOSTING where SalaryRate between 30000 and 70000

--17 For a specific applicants, list each job posting whose salary meets the applicant’s salary requirement
select distinct JOBPOSTING.JobPostingID, AFName +' '+ALName as [Applicant Full Name]
from APPLICANT 
inner join APPLICATION on APPLICANT.ApplicantID=APPLICATION.ApplicantID 
inner join APPLIEDJOBS on APPLICATION.ApplicationID=APPLIEDJOBS.ApplicationID 
inner join JOBPOSTING on APPLIEDJOBS.JobPostingID=JobPosting.JobPostingID
where SalaryRate >= (select PreferredWSalary*52 from APPLICATION where ApplicantID ='102')

--18 List the name of each company that currently has a job posted for a programmer that hasn’t been filled
select CompanyName from COMPANY inner join JOBPOSTING on
 COMPANY.CompanyID = JOBPOSTING.CompanyID inner join JOB on
	JOBPOSTING.JobID = JOB.JobID where JobDescription != 'programmer'