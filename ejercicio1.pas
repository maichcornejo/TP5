program ejercicio1;
    type
        aNombres=string[30];            //A de auxiliar
        aEdades=18..65;
        aEstudios=(Primario,secundario,terciario);
        aEstadoCiv=(Casado, SOltero, Viudo, Divorciado);
        aSexo=(Masculino, Femenino, otro);
        aIdiomas=(Espaniol, Frances, Portugues, Aleman);
        aDigitos='0'..'9';                      //CHEQUEAR SI VA CON APOSTROFES
        aDomicilio=record                        //Record usado para ALUMNOS
            Calle: string[30];
            Numero: array[1..4] of integer;
            Depto: 1..12;
        end;
        aLugarNac=record                        //Record usado para alumnos
            Ciudad:string[30];
            Provincia:String[30];
            Pais:String[30];
        end;
        aFecha=record                           //Record usado para alumnos
            Dia: byte;
            Mes: byte;
            Anio: byte;
        end;
    //EMPIEZAN LOS RECORDS 
        rEmpleados=record                       //EMPLEADOS, r de record
            Nombrecompleto:aNombres;
            Sexo: aSexo;
            Edad: aEdades;
            EstudiosCursados: aEstudios;
            EstadoCivil: aEstadoCiv;
        end;
        rLibros= record                  //LIBROS
            Titulo: array[1..40] of char;
            NombreAutor: aNombres;
            CantidadPags: array[1..4] of integer;
            Anio: 1900..2022;
            Idioma: aIdiomas;
        end;
        rAlumnos=record                         //ALUMNOS
            Dni: array[1..8] of aDigitos;
            ApellidoNombre: aNombres;            //preguntar si el nombre de la var se puede repetir(linea12)
            Domicilio: aDomicilio;              //preg si la mejor forma es haciendo otro record
            LugarNacimiento: aLugarNac;
            FechaIngreso: aFecha;
            NumeroLib:0..99999;             //Numero de libreta, chequear si esta bien
            Codigo: integer;                    //Código de carrera
            CantMAprobadas: byte;
            CantMCursadas: byte;
        end;
    //EMPIEZAN LOS ARRAY 
        tTablaEmpleados=array[7000..10000] of rEmpleados;
        tInfoLibros=array[1..100] of rLibros;
        tInfoAlumnos=array[1..100] of rAlumnos;  
    //EMPIEZA EL PROGRAMA
    var 
        empleado:rEmpleados;
        tabla:tTablaEmpleados;
        numerolegajo,i,j:integer;
begin
    writeln('Ingrese numero de legajo entre 7000 y 10000: ');
    readln(numerolegajo);
    tabla[numerolegajo].Nombrecompleto:='maia cornejo';
    tabla[numerolegajo].sexo:=Femenino;
    writeln(tabla[numerolegajo].sexo);
end.
