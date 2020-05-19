Class {
	#name : #RegistrarLibroComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'titulo',
		'autor',
		'editorial',
		'genero'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
RegistrarLibroComponent >> autor [ 

^autor
]

{ #category : #accessing }
RegistrarLibroComponent >> autor:unAutor [

autor:=unAutor asString .
]

{ #category : #'as yet unclassified' }
RegistrarLibroComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
RegistrarLibroComponent >> editorial [

^editorial
]

{ #category : #accessing }
RegistrarLibroComponent >> editorial:unaEditorial [

editorial:=unaEditorial.
]

{ #category : #accessing }
RegistrarLibroComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [aCanvas 
				paragraph: [ aCanvas label: 'Título: '.
					aCanvas textInput 
						callback: [ :valor| self titulo:valor];
					with: ''.].
				
			aCanvas 
				paragraph: [ aCanvas label: 'Autor: '.
					aCanvas select
						callback: [ :valor| self autor:valor];
				      list:(self model autores collect:[:a|a nombre,' ', a apellido]);	
					selected:self autor;	
					with: ''.].
				
				
				
				aCanvas 
				paragraph: [ aCanvas label: 'Editorial: '.
					aCanvas select
						callback: [ :valor| self editorial:valor];
						list:(self model editoriales collect:[:e|e nombreEditorial ]);	
					selected:self editorial;	
					with: ''.].
		             
		
		aCanvas 
				paragraph: [ aCanvas label: 'Generos: '.
					aCanvas select
						callback: [ :valor| self genero:valor];
						list:(self model generos collect:[:g|g nombreGenero]);	
					selected:self genero;	
					with: ''.].
			

 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Registrar libro'.
	
	
		aCanvas button
			callback: [self cancelar:aCanvas  ];
			with: 'Cancelar'.].].]
]

{ #category : #accessing }
RegistrarLibroComponent >> genero [

^genero.
]

{ #category : #accessing }
RegistrarLibroComponent >> genero:unGenero [

genero:=unGenero .
]

{ #category : #initialization }
RegistrarLibroComponent >> initialize [ 

super initialize 

]

{ #category : #accessing }
RegistrarLibroComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #'as yet unclassified' }
RegistrarLibroComponent >> registrar [


     self model registrarLibroConTitulo: self titulo  de: self autor  editadoPor: self editorial  genero: self genero .

	self answer

]

{ #category : #rendering }
RegistrarLibroComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]

{ #category : #rendering }
RegistrarLibroComponent >> renderLogoutButtonOn: aCanvas [

aCanvas div
		id: 'contLogout';
		with: [aCanvas div
				id: 'cuooter';
				with: [ "aCanvas text: 'Administrador en sesión: '.
					aCanvas paragraph: self session getUser user ."
			aCanvas div
				with: [ aCanvas anchor
						callback: [ self answer. ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ] ] ].
]

{ #category : #hooks }
RegistrarLibroComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;  } 
	#respuesta { text-align: center; }
	a {color:red} 
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
RegistrarLibroComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: [aCanvas text: 'Bookflix'].
		
		aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ].
		
aCanvas horizontalRule.


	

]

{ #category : #accessing }
RegistrarLibroComponent >> titulo [ 

^titulo
]

{ #category : #accessing }
RegistrarLibroComponent >> titulo:unTitulo [

titulo:=unTitulo.
]
