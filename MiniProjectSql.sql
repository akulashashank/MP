use Rajnikanth

create schema Raj_174851
drop table Raj_174851.Customer
drop table Raj_174851.InsuranceProducts
drop table Customer
select * from Customer
create table Customer
(
	CustomerId int primary key not null Identity(100, 1),
	Password varchar(25) not null,
	Name varchar(50) not null,
	Address varchar(250) not null,
	Telephone varchar(10) not null,
	Gender varchar(10) check(Gender in ('Male', 'Female', 'Others')),
	DOB date not null,
	isSmoker varchar(10)check(isSmoker in ('Smoker', 'NonSmoker')),
	Hobbies varchar(50) not null,
	CreatedDate date default getdate()
)

drop table customer
insert into Customer(Password,Name,Address,Telephone,Gender,DOB,isSmoker,Hobbies) values('dsd','dsad','dsad','32332','Male','2019-09-09','Smoker','wdw')
select * from Customer
select * from InsuranceProducts

create table InsuranceProducts
(
	Policyno int not null primary key identity,
	ProductName varchar(50) not null,
	PremiumPaymentFrequency varchar(10) not null,
	SumAssured money not null,
	BasePremium money not null,
	TotalPremium money not null,
	TotalPayment money not null,
	UplaodedDate date default getdate()
)
use Rajnikanth
select * from InsuranceProducts
delete InsuranceProducts where Policyno = 2
drop table InsuranceProducts
select * from Policy where Policyno=4
create table Policy
(	
	Policyno int not null foreign key references InsuranceProducts(Policyno),
	CustomerId int not null foreign key references Customer(CustomerId),
	ProductId int not null primary key Identity,
	Nominee varchar(50) not null,
	Relation varchar(50) not null,
	NomineeAddress varchar(250) not null,
	NomineeTelephone varchar(10) not null,
	NomineeDOB date not null,
	BoughtDate date default getdate(),
	UpdatedDate date 
)
insert into Policy(Policyno, CustomerId, Nominee, Relation, NomineeAddress, NomineeTelephone, NomineeDOB, BoughtDate) values(4, 100, 'Rajni', 'Freind', 'Chennai', '999999999', '2019-09-09', '2018-02-09')
insert into Policy(Policyno, CustomerId, Nominee, Relation, NomineeAddress, NomineeTelephone, NomineeDOB, BoughtDate) values(5, 100, 'Rajni', 'Freind', 'Chennai', '999999999', '2019-09-09', '2018-02-09')

select * from Policy
create table Documents
(
	SNo int primary key Identity not null,
	Policyno int not null foreign key references InsuranceProducts(Policyno),
	Idcard varchar(10) not null,
	Photo image not null,
	UploadedDate date default getdate()
)
ALTER TABLE Documents
ALTER COLUMN Photo nVarchar(max);
create table Endorsement
(
	EndorsementId int primary key not null,
	CustomerId int not null foreign key references Customer(CustomerId),
	ProductId int not null foreign key references Policy(ProductId),
	Policyno int not null foreign key references InsuranceProducts(Policyno),
	ChangesMade varchar(100) not null,
	Status varchar(15) check(Status in ('Accepted', 'Rejected', 'InProgress')),
	CreatedDate date default getdate(),
	ApprovedDate date,
	RejectedDate date
)
insert into Endorsement(EndorsementId,CustomerId,ProductId,Policyno,ChangesMade,Status,CreatedDate) values(1, 100, 1, 4, '{skjdh}', 'InProgress', '2019-09-09')
update Endorsement set Status='InProgress' where EndorsementId=1
select * from Endorsement