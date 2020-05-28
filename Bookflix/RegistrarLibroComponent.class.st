Class {
	#name : #RegistrarLibroComponent,
	#superclass : #AbstractAdminComponent,
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

{ #category : #accessing }
RegistrarLibroComponent >> titulo [ 

^titulo
]

{ #category : #accessing }
RegistrarLibroComponent >> titulo:unTitulo [

titulo:=unTitulo.
]
