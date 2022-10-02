CREATE TABLE Cliente(
	Id INT NOT NULL PRIMARY KEY,
	Nome Varchar(25) NOT NULL,
	Uf varchar(2) NOT NULL,
	Cpf Varchar(11) NOT NULL,
	Celular Varchar(20)
)

CREATE TABLE Financiamento(
	Id INT NOT NULL,
	Cpf Varchar(11) NOT NULL,
	Tipo Varchar(11) NOT NULL,
	Valor Decimal NOT NULL,
	Ultimo_vencimento Date,

	PRIMARY KEY (Id),
	Id_Cliente INT,

	CONSTRAINT FK_Id_Cliente FOREIGN KEY (Id_Cliente)
    REFERENCES Cliente(Id)
)

CREATE TABLE Parcela(
	Id INT NOT NULL,
	Numero Int NOT NULL,
	Valor Decimal NOT NULL,
	Vencimento Date NOT NULL,
	Data_Pagamento Date,

	Id_financiamento INT,

	CONSTRAINT FK_Id_financiamento FOREIGN KEY (Id_financiamento)
    REFERENCES Financiamento(Id)
)
