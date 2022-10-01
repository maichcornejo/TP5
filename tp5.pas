program tp5;
type
    edades= 18..65;
    estudios= (primarios, secundarios, terciarios, p, s, t); //borrar despues 
    civil= (casado, soltero, viudo, divorciado, casada, soltera, viuda, divorciada);
    anno= 1900..2022;
    idioma= (espannol, ingles, frances, portugues, aleman);
    digitos= 0..9;
    genero= (f, m, masculino, femenino);

    tLugarnac=record
        ciudad: string;
        provincia:string;
        pais:string;
    end;
    tfecha= record
        dia: byte;
        mes: byte;
        anio: integer;
    end;

    tdomicilio= record
        calle: string;
        numero: integer;
        departamento: string;
    end;

    tEmpleados= record
        nombre: string [35];
        sexo: genero;
        edad: edades;
        cursados: estudios;
        estado: civil;
    end;

    tLibros= record
        titulolibro: string;
        nombreautor: string;
        paginas: integer;
        annoedicion: anno;
        idiomaesc: idioma;
    end;

    tAlumnos= record
        dni: string;
        nombrealumno: string;
        domicilio: tdomicilio;
        telefono: string;
        LugarNacimiento:tLugarnac;
        fechaing: tfecha;
        numlibreta: string;
        codigo: integer;
        mataprobadas: integer;
        matcursadas: integer;
    end;
    TTablaempleados= array [7000..10000] of tEmpleados;
    TInfolibros= array [1..200] of tLibros;
    TInfoalumnos= array[1..200] of tAlumnos;
    

    var 
    codigocarrera,paraentrar2,i,paraentrar,numerolegajo,contador,contadorlibros,cantidadalumnos, cantidadlibros:integer;
    mEmpleados:TTablaempleados;
    mLibros:TInfolibros;
    mAlumnos:TInfoalumnos;
    cantlegajos:array[1..3000]of integer;
    documento,autornombre:string;
    
procedure  Libritos(var matriz: TInfolibros); //PROCEDURE CARGA LIBROS
    begin
        with matriz[cantidadlibros] do begin
            writeln ('ingrese el titulo del libro: ');
            readln(titulolibro);
            writeln ('Ingrese nombre del autor: ');
            readln(nombreautor);
            writeln ('Ingrese la cantidad de paginas: ');
            readln(paginas);
            writeln ('Ingrese el año de edicion: ');
            readln(annoedicion);
            writeln ('Ingrese el idioma del libro: ');
            readln(idiomaesc);
        end;
    end;
procedure listado(matriz:TTablaempleados); //IMPRIME
    begin   
      with matriz[numerolegajo] do begin
      write(nombre,#9,#9);
      write(edad,#9,#9);
      write(sexo,#9,#9);
      write(cursados,#9,#9);
      write(estado,#9,#9);
      end;
    end;
procedure  Legajos(var matriz: TTablaempleados); //CARGA LEGAJOS
    begin
        with matriz[numerolegajo] do begin
            writeln ('Ingrese Nombre y apellido: ');
            readln(nombre);
            writeln ('Ingrese edad: ');
            readln(edad);
            writeln ('Ingrese sexo: ');
            readln(sexo);
            writeln ('Ingrese estudios cursados: ');
            readln(cursados);
            writeln ('Ingrese estado civil: ');
            readln(estado);
        end;
    end;
procedure  Alumnitos(var matriz: TInfoalumnos); //CARGA ALUMNOS
    begin
        with matriz[cantidadalumnos] do begin
            writeln ('Ingrese Apellido y nombre del alumno: ');
            readln(nombrealumno);
            writeln ('Ingrese domicilio');
                    with domicilio do begin
                            writeln('ingrese la calle: ');
                            readln(calle);
                            writeln('ingrese el numero de calle: ');
                            readln(numero);
                            writeln('ingrese el departamento: ');
                            readln(departamento);
                    end;
            writeln ('Ingrese telefono: ');
            readln(telefono);
            writeln ('Ingrese lugar de nacimiento');
                    with LugarNacimiento do begin
                            writeln('ingrese la ciudad: ');
                            readln(ciudad);
                            writeln('ingrese la provincia: ');
                            readln(provincia);
                            writeln('ingrese el pais: ');
                            readln(pais);
                            end;
            writeln('Ingrese fecha de ingreso');
                    with fechaing do begin
                            writeln('ingrese el dia: ');
                            readln(dia);
                            writeln('ingrese el mes: ');
                            readln(mes);
                            writeln('ingrese el anio: ');
                            readln(anio);
                            end;
            writeln('Ingrese numero de libreta:');
            readln(numlibreta);
            writeln('Ingrese codigo carrera');
            read(codigo);
            writeln('Ingrese materias aprobadas');
            readln(mataprobadas);
            writeln('Ingrese materias cursadas');
            readln(matcursadas);
        end;
    end;
procedure busqueda(nombrecito:string);
        begin
            for i:=1 to cantidadlibros do
            begin
                if (nombrecito=mlibros[i].nombreautor) then
                    writeln(mlibros[i].titulolibro); 
            end;
        end;
procedure investigacion (minions:integer);
        begin
            for i:=1 to cantidadalumnos do
                begin
                if (minions=mAlumnos[i].codigo) then
                    begin
                        if (malumnos[i].mataprobadas>=10) then
                        writeln(mAlumnos[i].nombrealumno);
                    end;
                end;  
        end;
procedure discriminador (matriz: tTablaEmpleados);  //18 y 25 y tiene terciarios
    begin
        if (matriz[numerolegajo].edad<=25) and (matriz[numerolegajo].cursados=terciarios) then 
        begin
            writeln(matriz[numerolegajo].nombre);
            contadorlibros:=contadorlibros+1;
        end;
    end;

begin         
    cantidadalumnos:=0;   //emíeza el programa principal
    cantidadlibros:=0;
    contador:=0;
    repeat
        WriteLn('Ingrese numero de legajo entre 7000 y 10000 o 0 para salir: ');
        readln(numerolegajo);
        if (numerolegajo>=7000) and (numerolegajo<=10000) then //carga legajos
            begin
                Legajos(mempleados);
                contador:=contador+1;
                cantlegajos[contador]:=numerolegajo;
            end
        else if (numerolegajo<>0) then
            writeln('Numero fuera de rango');
    until (numerolegajo=0);
    writeln('');
    write('Nombre'#9#9#9);
    write('Edades'#9#9);
    write('Sexo'#9#9);
    write('Cursados'#9#9);
    write('Estado'#9#9);
    writeln('');
    for i:=1 to contador do  //IMPRIME LEGAJO 
        begin
            numerolegajo:=cantlegajos[i];
            listado(mempleados);
            writeln;
        end;
    writeln;
    writeln('Los que tienen entre 18 y 25 y tienen terciarios son: '); //INCISO C
    for i:=1 to contador do 
        begin
            numerolegajo:=cantlegajos[i];
            discriminador(mempleados);
            writeln;
        end;
    repeat
        writeln('aprete 0 para salir o cualquier numero para escribir los libros');
        readln(paraentrar);
            if (paraentrar<>0) then
            begin
                cantidadlibros:=cantidadlibros + 1;
                Libritos(mlibros);
            end;
    until (paraentrar=0);
    writeln('Ingrese nombre de autor que quiera buscar');
    readln(autornombre);
    busqueda(autornombre);
        repeat
        writeln('aprete 0 para salir o cualquier numero para escribir sobre los alumnos');
        readln(paraentrar2);
            if (paraentrar2<>0) then
            begin
                cantidadalumnos:=cantidadalumnos + 1;
              Alumnitos(mAlumnos);
            end;
        until paraentrar2=0;
    writeln('ingrese el codigo de carrera');
    readln(codigocarrera);
    investigacion(codigocarrera);
end.