Class {
	#name : #ListaAutoresComponent,
	#superclass : #AbstractAdminComponent,
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ListaAutoresComponent >> cancelar [

self answer .
]

{ #category : #'as yet unclassified' }
ListaAutoresComponent >> irEliminar: unAutor [
	self call: ((MensajeConfirmacionAutorComponent new) autor: unAutor)
]

{ #category : #'as yet unclassified' }
ListaAutoresComponent >> irModificar: unAutor [
	
self call: ((ModificarAutorComponent new)autor: unAutor)
]

{ #category : #'as yet unclassified' }
ListaAutoresComponent >> irRegistrarAutor [
	self call: (RegistrarAutorComponent  new ).
	"self answer ."
]

{ #category : #accessing }
ListaAutoresComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
ListaAutoresComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
	class: 'centrar';
	with:[
	aCanvas table
		with: [ aCanvas tableHead
				with: [ aCanvas tableHeading: 'Nombre'.
					aCanvas tableHeading: 'Apellido'.
					aCanvas tableHeading: 'Fecha de Nacimiento'.
					aCanvas tableHeading: 'Fecha de Defunción'.
					aCanvas tableHeading.
					aCanvas tableHeading.
					].

			aCanvas tableBody
			with:[	
			self model autores
				do: [ :each | 
					aCanvas tableRow
						with: [ aCanvas tableData: each nombre.
							aCanvas tableData: each apellido.
							aCanvas tableData: each fechaDeNac.
							aCanvas tableData: each fechaDeDef.
							aCanvas tableData
							with:[aCanvas anchor
								callback:[self irModificar: each];
								with:'Modificar'.].
							aCanvas tableData
							with:[	
							aCanvas anchor
								callback:[self irEliminar: each];
								with:'Eliminar'].]
							.] ] ]]
]
