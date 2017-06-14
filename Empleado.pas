UNIT Empleado;
INTERFACE
TYPE
	TEmpleado = RECORD
		nombre : STRING;
		edad : INTEGER;
		sueldo : REAL;
	END;
{Operaciones Constructoras Generadoras}
PROCEDURE CrearEmpleado(VAR em:TEmpleado; n:STRING; e:INTEGER; s:REAL);
{Operaciones Constructoras no Generadoras}
PROCEDURE ModificarNombreEmpleado(VAR em:TEmpleado;n:STRING);
PROCEDURE ModificarEdadEmpleado(VAR em:TEmpleado; e:INTEGER);
PROCEDURE ModificarSueldoEmpleado(VAR em:TEmpleado;s:REAL);
{Operaciones Observadoras Selectoras}
PROCEDURE Asignar(VAR emp1:TEmpleado; emp2:TEmpleado);
FUNCTION NombreEmpleado(empleado:TEmpleado):STRING;
FUNCTION EdadEmpleado(empleado:TEmpleado):INTEGER;
FUNCTION SueldoEmpleado(empleado:TEmpleado):REAL;
{Operaciones Observadoras No Selectoras}
FUNCTION EsIgual(e1:TEmpleado; e2:TEmpleado):BOOLEAN;

IMPLEMENTATION
{Operaciones Constructoras generadoras}
PROCEDURE CrearEmpleado(var em:TEmpleado;n:STRING; e:INTEGER; s:REAL);
BEGIN
	IF (e>=16) THEN
		BEGIN
			em.nombre:= n;
			em.edad:= e;
			em.sueldo:= s;
		END
	ELSE
		writeln('Empleado demasiado joven para ser contratado');
END;
{Operaciones Constructoras no Generadoras}
PROCEDURE ModificarNombreEmpleado(VAR em:TEmpleado; n:STRING);
BEGIN
	em.nombre:=n;
END;

PROCEDURE ModificarEdadEmpleado(VAR em:TEmpleado; e:INTEGER);
BEGIN
	em.edad:=e;
END;

PROCEDURE ModificarSueldoEmpleado(VAR em:TEmpleado; s:REAL);
BEGIN
	IF(s>=0)THEN
		em.sueldo:=s;
END;

{Operaciones Observadoras Selectoras}
PROCEDURE Asignar(VAR emp1:TEmpleado; emp2:TEmpleado);
BEGIN
	emp1.nombre:= emp2.nombre;
	emp1.edad:=emp2.edad;
	emp1.sueldo:=emp2.sueldo;
END;

FUNCTION NombreEmpleado(empleado:TEmpleado):STRING;
BEGIN
	NombreEmpleado:=empleado.nombre;
END;

FUNCTION EdadEmpleado(empleado:TEmpleado):INTEGER;
BEGIN
	EdadEmpleado:=empleado.edad;
END;

FUNCTION SueldoEmpleado(empleado:TEmpleado):REAL;
BEGIN
	SueldoEmpleado:=empleado.sueldo;
END;

{Operaciones Observadoras No Selectoras}
FUNCTION EsIgual(e1:TEmpleado; e2:TEmpleado):BOOLEAN;
BEGIN
	EsIgual:= (e1.nombre=e2.nombre) AND (e1.edad=e2.edad);
END;

begin

end.
