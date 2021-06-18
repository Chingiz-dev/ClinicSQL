SELECT Clients.Name, Clients.Surname, Clients.Birthday, ClientApply.ApplyDate, ClientApply.Symptoms, 
Specializations.Specialization, Employees.Name, Departments.DepartmentText, ServiceTypes.TypeText, ServiceNames.NamesText,
Prices.Value, Statuses.StatusText, TreatmentHistory.DischargeDate, Comments.CommentText, Comments.CommentData
FROM TreatmentHistory
JOIN ClientApply on ClientApply.ClientApplyId = TreatmentHistory.ClientApplyId
JOIN Clients on Clients.ClientId = ClientApply.ClientId
JOIN Employees on Employees.EmployeeId = TreatmentHistory.EmployeeId
JOIN Specializations on Specializations.SpecializationId = Employees.SpecializationId
JOIN Departments on Departments.DepartmentId = Employees.DepartmentId
JOIN Services on Services.ServiceId = TreatmentHistory.ServiceId
JOIN ServiceTypes on ServiceTypes.ServiceTypeId = Services.ServiceTypeId
JOIN ServiceNames on ServiceNames.ServiceNameId = Services.ServiceNameId
JOIN Prices on Prices.PriceId = Services.PriceId
JOIN Statuses on Statuses.StatusId = TreatmentHistory.StatusId
JOIN Comments on Comments.CommentId = TreatmentHistory.CommentId

SELECT Clients.Name, Clients.Surname, Genders.Gender, Clients.Fin, Clients.Number, Clients.Email, ApplyDate, Symptoms
FROM ClientApply
JOIN Clients on Clients.ClientId = ClientApply.ClientId
JOIN Genders on Genders.GenderId = Clients.GenderId

SELECT COUNT(a.Value) as ValueCount, SUM(a.Value) as ValueSum FROM (SELECT Clients.ClientId, Clients.Name, Clients.Surname, ClientApply.ClientApplyId, Prices.Value
FROM TreatmentHistory
JOIN Services on Services.ServiceId = TreatmentHistory.ServiceId
JOIN Prices on Prices.PriceId = Services.PriceId
JOIN ClientApply on ClientApply.ClientApplyId = TreatmentHistory.ClientApplyId
JOIN Clients on Clients.ClientId = ClientApply.ClientId) as a
Group by a.ClientApplyId
