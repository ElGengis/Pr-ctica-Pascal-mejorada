UNIT Empleados;

INTERFACE
USES Empleado;
TYPE
	TListaEmpleados = ^TEmpleados;
	TEmpleados = RECORD
		empleado:TEmpleado;
		sig:TListaEmpleados;
	END;


{Operaciones Constructoras Generadoras}
PROCEDURE CrearListaEmpleadosVacia(VAR em:TListaEmpleados);
PROCEDURE AniadirEmpleado(e:TEmpleado;VAR em:TListaEmpleados);
{Operaciones Constructoras no Generadoras}
PROCEDURE EliminarEmpleadoLista(e:TEmpleado; VAR em:TListaEmpleados);
{Operaciones Observadoras Selectoras}
{Operaciones Observadoras No Selectoras}
FUNCTION EsListaEmpleadosVacia(em:TListaEmpleados):BOOLEAN;

IMPLEMENTATION
{Operaciones Constructoras Generadoras}
PROCEDURE CrearListaEmpleadosVacia(VAR em:TListaEmpleados);
BEGIN
	em:=NIL;
END;

PROCEDURE AniadirEmpleado(e:TEmpleado;VAR em:TListaEmpleados);
VAR
	aux:TListaEmpleados;
BEGIN
	new(aux);
	Asignar(aux^.empleado,e);
	aux^.sig:=em;
	em:=aux;
END;
{Operaciones Constructoras no Generadoras}
PROCEDURE EliminarEmpleadoLista(e:TEmpleado; VAR em:TListaEmpleados);
VAR
	aux, aux2:TListaEmpleados;

BEGIN
	new(aux);
	IF NOT EsListaEmpleadosVacia(em) THEN BEGIN
		aux:=em;
		WHILE NOT(EsIgual(aux^.sig^.empleado,e)) AND (NOT EsListaEmpleadosVacia(aux)) DO
			aux:=aux^.sig;
		IF EsIgual(aux^.empleado,e)THEN BEGIN
			aux2:=aux;
			aux:=aux^.sig;
			aux2^.sig:= aux^.sig;
			dispose(aux);
		END;
	END;
END;

{Operaciones Observadoras Selectoras}
{Operaciones Observadoras No Selectoras}
FUNCTION EsListaEmpleadosVacia(em:TListaEmpleados):BOOLEAN;
BEGIN
	EsListaEmpleadosVacia:= (em=NIL);
END;

begin

end.
