"
""----------------para INSTALAR PAQUETE DE MOLD EJECUTAR SOLO UNA VEZ en PLAYGROUND:

Metacello new 
  baseline: 'Mold';
  repository: 'github://grype/Seaside-Mold/src';
  load.



---------------------------------------------------------------------------------------


|application|

""--------------------------------SEASIDE REGISTRO--------------------------------------""




application:=WAAdmin register: LoginAdminWithMoldComponent asApplicationAt: 'loginAdmin'.
application:=WAAdmin register: LoginWithMoldComponent asApplicationAt: 'loginUser'.
WAAdmin register: RegistroComponent  asApplicationAt: 'Registro'.
application sessionClass: SessionWithUser.
WAAdmin register: HomeComponent  asApplicationAt: 'BookflixHome'.
WAAdmin register:CuentaComponent   asApplicationAt: 'Cuenta'.
WAAdmin register: EditarNombreUserComponent  asApplicationAt: 'EditarNombre'.
WAAdmin register: EditarApellidoUserComponent  asApplicationAt: 'EditarApellido'.
WAAdmin register: EditarEmailUserComponent  asApplicationAt: 'EditarEmail'.
application:=WAAdmin register: HomeAdminComponent  asApplicationAt: 'HomeAdmin'.
WAAdmin register: RegistroExitosoComponent   asApplicationAt: 'RegistroExitoso'.
WAAdmin register: ErrorLoginComponent   asApplicationAt: 'ErrorLogin'.
WAAdmin register: RegistrarLibroComponent asApplicationAt: 'RegistroLibro'.
WAAdmin register: ListaLibrosComponent asApplicationAt: 'ListaLibros'.
WAAdmin register: RegistroAutorComponent asApplicationAt: 'RegistroAutor'.
WAAdmin register: ListaAutoresComponent asApplicationAt: 'ListaAutores'.
WAAdmin register: RegistroGeneroComponent asApplicationAt: 'RegistroGenero'.
WAAdmin register: RegistroEditorialComponent asApplicationAt: 'RegistroEditorial'.
WAAdmin register: DetalleLibroComponent asApplicationAt: 'DetalleLibro'.
WAAdmin register: CargarNovedadComponent asApplicationAt: 'CargarNovedad'.
WAAdmin register: EditarEditorialComponent asApplicationAt: 'EditarEditorialDeLibro'.
WAAdmin register: EditarAutorComponent asApplicationAt: 'EditarAutorDeLibro'.
WAAdmin register: EditarTituloComponent asApplicationAt: 'EditarTituloDeLibro'.
WAAdmin register: EditarGeneroComponent asApplicationAt: 'EditarGeneroDeLibro'.


""----------------------------------------------------------------------------------------""
SistemaBookflix clearSoleInstance .
BookflixSampleLoader new loadExampleDataIn: SistemaBookflix soleInstance . 





























----------------------------- ACA EMPIEZA EL QUE TIENE RO, NO LO USO YO, ESTA DESACTUALIZADO----------------------------------------



|application|

""--------------------------------SEASIDE REGISTRO--------------------------------------""

application:=WAAdmin register: LoginComponent  asApplicationAt: 'bookflix'. 
WAAdmin register: RegistroComponent  asApplicationAt: 'registro'.
application sessionClass: SessionWithUser.
WAAdmin register: HomeComponent  asApplicationAt: 'bookflixHome'.
WAAdmin register:CuentaComponent   asApplicationAt: 'cuenta'.
WAAdmin register: EditarNombreUserComponent  asApplicationAt: 'editarNombre'.
WAAdmin register: EditarApellidoUserComponent  asApplicationAt: 'editarApellido'.
WAAdmin register: EditarEmailUserComponent  asApplicationAt: 'editarEmail'.

application:=WAAdmin register: HomeAdminComponent  asApplicationAt: 'homeAdmin'.
WAAdmin register: RegistroExitosoComponent   asApplicationAt: 'registroExitoso'.
WAAdmin register: ErrorLoginComponent   asApplicationAt: 'errorLogin'.
WAAdmin register: RegistrarLibroComponent asApplicationAt: 'registroLibro'.
WAAdmin register: ListaLibrosComponent asApplicationAt: 'listaLibros'.


""----------------------------------------------------------------------------------------""
SistemaBookflix clearSoleInstance .
BookflixSampleLoader new loadExampleDataIn: SistemaBookflix soleInstance . 
"
Class {
	#name : #LoginWithMoldComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuenta',
		'mold'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
LoginWithMoldComponent >> buildMold [
mold := Mold new.
  (mold stringField)
    label: 'Nombre de usuario:';
	 on: #user of: self cuenta;
    beRequired: 'El campo es requerido'.
	
  (mold passwordField)
    label: 'Contraseña:';
	 on: #password of:self cuenta;
    beRequired: 'El campo es requerido'.
	 
]

{ #category : #accessing }
LoginWithMoldComponent >> cuenta [
	^cuenta.
]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> formularioLogin:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		with:[
aCanvas form:
    [mold canvas: aCanvas.
    mold paragraphs.
    (aCanvas button)
      callback: [self login];
      value: 'Iniciar sesión'.


	 (aCanvas button)
      callback: [self irRegistro];
      value: 'Registrar'
]]].

]

{ #category : #initialization }
LoginWithMoldComponent >> initialize [
	super initialize. 
	cuenta:= Cuenta new.
	self buildMold.
]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> irErrorLogin [
	self call: ErrorLoginComponent new.
]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> irHome: aUser [

self session setUser:aUser.

self call: HomeComponent new.

self answer.
]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> irRegistro [ 
   self call: RegistroComponent new.
]

{ #category : #'private protocol' }
LoginWithMoldComponent >> login [
  mold isValid ifFalse: [^self].
  mold save.
   (self model withUsername:cuenta user ypass:cuenta password)
		ifNotNil: [ :it | self irHome:it ]
		ifNil:[self irErrorLogin].
  self answer.
 
  

"login 

(self model withUsername:cuenta user ypass:cuenta password)
		ifNotNil: [ :it | self irHome:it ]
		ifNil:[self irErrorLogin].
		
	cuenta:=Cuenta new conUser:'user' conNombre:'.' conApellido:'.' conMail:'.' yPass:'password'."  
]

{ #category : #accessing }
LoginWithMoldComponent >> model [
^ SistemaBookflix soleInstance
]

{ #category : #rendering }
LoginWithMoldComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioLogin: aCanvas ]
		

	
 
]

{ #category : #hooks }
LoginWithMoldComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;} 
	#respuesta { text-align: center; }
	a {color:red} 
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
