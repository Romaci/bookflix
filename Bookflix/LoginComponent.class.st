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
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'password'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
LoginComponent >> formularioLogin:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		with: [ aCanvas form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre de usuario: '.
					aCanvas textInput 
						callback: [ :valor| self setUser:valor];
					with: ''.].
			
	
			aCanvas paragraph: [ aCanvas label: 'Password: '.
					aCanvas passwordInput
					callback: [ :valor| self setPassword:valor];
					with: ''.].
 
	
		aCanvas button
			callback: [self login ];
			with: 'Iniciar sesión'.
		
		
		aCanvas button
			callback: [self irRegistro ];
			with: 'Registrarse'.].
		]. ].



]

{ #category : #initialization }
LoginComponent >> initialize [
	super initialize. 
	
]

{ #category : #'as yet unclassified' }
LoginComponent >> irErrorLogin [

self call: ErrorLoginComponent new.
]

{ #category : #'as yet unclassified' }
LoginComponent >> irHome: aUser [

self session setUser:aUser.

self call: HomeComponent new.

]

{ #category : #'as yet unclassified' }
LoginComponent >> irRegistro [ 
   self call: RegistroComponent new.
]

{ #category : #'private protocol' }
LoginComponent >> login [ 
(self model withUsername:user ypass:password)
		ifNotNil: [ :it | self irHome:it ]
		ifNil:[self irErrorLogin].
	user:= nil.
	password := nil
]

{ #category : #accessing }
LoginComponent >> model [
^ SistemaBookflix soleInstance
]

{ #category : #rendering }
LoginComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioLogin: aCanvas ]
 
]

{ #category : #initialization }
LoginComponent >> setPassword:unaPass [
password :=unaPass. 
]

{ #category : #'as yet unclassified' }
LoginComponent >> setUser: unUser [
user:= unUser.
]

{ #category : #hooks }
LoginComponent >> style [
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
LoginComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'Bookflix';
		with: [ aCanvas text: 'Bookflix' ].
	
]
