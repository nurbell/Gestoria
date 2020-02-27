Algoritmo gestoria_DASU
	
	// Declaración de variables, arrays
	
	salir<- falso;
	
	definir posicion como real;
	dimension posicion[8];
	
	definir documentos como cadena;
	dimension documentos[8]	
	
	definir opcion_elegida como caracter;
	lleno es logico;
	
	definir tam como entero;
	tam<-8;
	i es entero;
	
	Escribir "---------------------------------------------------------"
	Escribir " Gestoría DASU - Gestión Documental de la Gestoría" 
	EScribir "---------------------------------------------------------"
	
	// *** Rellenamos de contenido los arrays **********
	
	//Primero array posicion
	
	Para i<-1 Hasta 8 Con Paso 1 Hacer
		Escribir ("Introduzca El Numero del documento")
		Leer posicion[i]
	Fin Para
	// Segundo array documentos.
	Para i<-1 Hasta 8 Con Paso 1 Hacer
		Escribir ("Introduzca los datos del documento")
		Leer documentos[i]
	Fin Para
	
	// ***** Fin del rellenado de datos del array ***************************************
	
// *******Aqui haremos el Menú, con las opciones que va hacer el programa *************
// Procedemos a realizar un bucle, mientras, para que nos repita el menu 
// hasta que se presione s, o S, no saldra de programa.
	Repetir
		//mostrar menu
		//Borrar Pantalla
		Escribir "GESTION DE DOCUMENTOS"
		Escribir "1. VISUALIZACIóN DE DOCUMENTOS"
		Escribir "2. BÚSQUEDA DE DOCUMENTOS"
		Escribir "3. EDICIÓN DE DOCUMENTOS"
		Escribir "4. CREAR DOCUMENTOS"
		Escribir "5. BORRAR DOCUMENTOS"
		Escribir "6. IMPRESIÓN DE DOCUMENTOS"
		//ingresar una opcion
		Escribir "Elige una opción 1-6 (pulsa la letra S para salir)"
		Leer eleccion
		//procesar esa opción
		Segun eleccion hacer
			"1":	
				Escribir "Bienvenido a VISUALIZACIóN DE DOCUMENTOS"
				visualizar(documentos,posicion)
				
				Escribir " "
				Escribir "FINALIZADO, pulsa una letra para continuar"
				leer espera;
			"2":
				Escribir "Bienvenido a BÚSQUEDA DE DOCUMENTOS"
				Buscar_documentos()
				Escribir " "
				Escribir "FINALIZADO, pulsa una letra para continuar"
				leer espera;
			"3":
				Escribir "Bienvenido a  EDICIÓN DE DOCUMENTOS"
				editar_documentos(documentos,posicion)
				Escribir " "
				Escribir "FINALIZADO, pulsa una letra para continuar"
				leer espera;
			"4":
				Escribir "Bienvenido a CREAR DOCUMENTOS"
				crear_documento(documentos,posicion,final,i,text)
				Escribir " "
				Escribir "FINALIZADO, pulsa una letra para continuar"
				leer espera;
			"5":
				Escribir "Bienvenido a BORRAR DOCUMENTOS"
				borrar_documento(posicion,documentos,end)
				Escribir " "
				Escribir "FINALIZADO, pulsa una letra para continuar"
				leer espera;
			"6":
				Escribir "Bienvenido a IMPRESIÓN DE DOCUMENTOS"
				impresion()
				Escribir " "
				Escribir "FINALIZADO, pulsa una letra para continuar"
				leer espera;
			:
		FinSegun		
	Hasta Que eleccion="s" o eleccion="S"
	Escribir "FIN"
FinAlgoritmo	

//************* Aqui finaliza el menu del programa ***************************

		
//****** Aqui crearemos el Subproceso visualizacion de documentos, para que muestre ***************
	
Subproceso visualizar (d Por Referencia, p Por Referencia )
	
	Para i<-1 Hasta 8 Con Paso 1 Hacer
	//Si documento_vacio(d,p)
		Escribir "La posicion: ",i," Tiene el documento ",p[i], " y su contenido es ",d[i];
	//SiNo
		//Escribir "$"
	//
	
	
Fin Para
	
		
FinSubProceso

// ****Aqui termina el Subproceso visialización de documentos **************
//*****************subprocesoBÚSQUEDA DE DOCUMENTOS**********************
SubProceso Buscar_documentos()
Escribir"Indice"	
FinSubProceso
//****fin del subproceso Busqueda_documentos*****************************
//*******SubprocesoEDICIÓN DE DOCUMENTOS*********************************
Subproceso editar_documentos(d Por Referencia,p por referencia)
	Escribir"Indique el documento que desea modificar"
	leer documento
	Escribir " Introduzca el texto a añadir al documento"
	leer palabra
	para i<-1 hasta 8 con paso 1 Hacer
		si p[i]=documento Entonces
			d[i]=concatenar(d[documento],palabra)
			Escribir "el documento editado es ",d[i]," En la posicion ",i
		//SiNo
			//Escribir "El numero no existe"
		FinSi
	FinPara
	
FinSubProceso
//**********fin del subproceso editar_documentos**************************
//************Subproceso CREAR DOCUMENTOS*********************************

SubProceso crear_documento(d por referencia,p por referencia,f por referencia,i por referencia,text por referencia)
		final<-8;
		Escribir "Introduce el texto que quieres añadir:"
		Leer text;
		
		d[final]<-text;
		Escribir "El texto se han añadido al posicion  ",final;
		
FinSubProceso

//*******fin del subproceso crear_documentos******************************
//*************Subproceso BORRAR DOCUMENTOS*******************************
Subproceso borrar_documento(p por referencia,d por referencia,e por referencia)
	end<-6;
	
	Si documento_lleno(d) Entonces
		d[end]<-"$";
		
		Escribir "El contenido en la posicion  ",end,"  esta eliminado"
		end=end-1;
	finsi
FinSubProceso
//********fin del subproceso borrar_documento*****************************
//**********Subproceso IMPRESIÓN DE DOCUMENTOS****************************
Subproceso impresion()
	Escribir"Indice"
FinSubProceso
Funcion lleno <- documento_lleno(d por referencia)
	lleno es logico;
	lleno<-falso;
	
	Para i<-1 Hasta 8 Hacer
		Si d[i]!="$" Entonces
			
			lleno<-verdadero
		SiNo
			lleno<-falso
		Fin Si
	FinPara
	Si lleno es verdadero Entonces
		Escribir ' Hay documento en esta posicion';
	SiNo
		Escribir 'No hay documento en esta posicion';
	Fin Si
Fin Funcion
//*******fin del subproceso impresion*************************************


