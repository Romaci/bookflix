Class {
	#name : #CargarNovedadComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'file',
		'nombreClave',
		'titulo',
		'sinopsis',
		'autor'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
CargarNovedadComponent >> autor [
^autor
]

{ #category : #accessing }
CargarNovedadComponent >> autor:unAutor [
autor:=unAutor
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> cancelar:aCanvas [

self answer.
]

{ #category : #accessing }
CargarNovedadComponent >> file [
^file
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> formularioNovedad: aCanvas [
	aCanvas horizontalRule
		with: [ aCanvas div
				id: 'formLogin';
				with: [ aCanvas
						form: [ aCanvas
								paragraph: [ aCanvas label: 'Nombre Clave: '.
									aCanvas textInput
										callback: [ :valor | self nombreClave: valor ];
										with: self nombreClave ].
							aCanvas
								paragraph: [ aCanvas label: 'Título: '.
									aCanvas textInput
										callback: [ :valor | self titulo: valor ];
										with: self titulo ].
							aCanvas
								paragraph: [ aCanvas label: 'Autor: '.
									aCanvas select
										callback: [ :valor | self autor: valor ];
										list: (self model autores collect: [ :a | a nombre , ' ' , a apellido ]);
										selected: self autor;
										with: self autor ].
						
			         	aCanvas label: 'Sinopsis: '.
								aCanvas paragraph:[
									aCanvas textArea
										style:'width:400px; height:300px';
										callback: [ :valor | self sinopsis: valor ];
										with:''.].
									
										aCanvas label
								for: 'upload';
								with: 'Elegir la novedad a cargar:   '.
							aCanvas fileUpload
								readonly: true;
								id: 'upload';
								callback: [ :f | self upload: f ] .
							aCanvas break.
							
							
					aCanvas button
						callback: [ self registrar: aCanvas ];
						with: 'Cargar Novedad'.
					aCanvas button
						callback: [ self cancelar: aCanvas ];
						with: 'Cancelar' ] ] ]
]

{ #category : #testing }
CargarNovedadComponent >> isValid [
self errorMessage  removeAll.
self successMessage: false.
     ^ errorMessage isEmpty.

]

{ #category : #accessing }
CargarNovedadComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> modificarAutor:unaNovedad [

self call: (EditarAutorComponent new autorDe:unaNovedad).
]

{ #category : #accessing }
CargarNovedadComponent >> nombreClave [ 
^nombreClave 
]

{ #category : #accessing }
CargarNovedadComponent >> nombreClave:unNombreClave [

nombreClave :=unNombreClave .
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> registrar: aCanvas [
	self isValid
		ifTrue: [ (self model
				cargarNovedad: self file conNombreClave:self nombreClave   titulo:self titulo   autor:self autor  sinopsis:self sinopsis ).
			self successMessage: true ].
	
	^ self
]

{ #category : #rendering }
CargarNovedadComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas div
		id: 'formLogin';
		with: [ self formularioNovedad: aCanvas ].
	self mensajes: aCanvas de: 'La Novedad se cargó correctamente'
	
	
]

{ #category : #accessing }
CargarNovedadComponent >> sinopsis [ 
^sinopsis
]

{ #category : #accessing }
CargarNovedadComponent >> sinopsis:aSinopsis [
sinopsis:=aSinopsis
]

{ #category : #accessing }
CargarNovedadComponent >> titulo [ 
^titulo
]

{ #category : #accessing }
CargarNovedadComponent >> titulo:unTitulo [

titulo:=unTitulo
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> upload:aFile [

file:=aFile. 


]
