Class {
	#name : #CargarNovedadComponent,
	#superclass : #WAComponent,
	#instVars : [
		'file',
		'nombreClave'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
CargarNovedadComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #accessing }
CargarNovedadComponent >> nombreClave:unNombreClave [

nombreClave :=unNombreClave .
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> registrar [

self model cargarNovedad: file conNombreClave: nombreClave . 
    
self answer
]

{ #category : #rendering }
CargarNovedadComponent >> renderContentOn: aCanvas [

aCanvas form
  multipart;
  with:
    [aCanvas paragraph: [ aCanvas label: 'Nombre clave de la novedad: '.
					aCanvas textInput 
						callback: [ :valor| self nombreClave:valor];
					with: ''.].
	
	(aCanvas label)
       for: 'upload';
       with: 'Elegir la novedad a cargar'.
aCanvas break.
    (aCanvas fileUpload)
       readonly: true;
       id: 'upload';
       callback: [:f | self upload: f]].

			aCanvas button
			callback: [self registrar  ];
			with: 'Registrar'.
	
		"aCanvas submitButton text: 'Guardar novedad'."
		
	
	
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> upload:aFile [

file:=aFile. 


]
