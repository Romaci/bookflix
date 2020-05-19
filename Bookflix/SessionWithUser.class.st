Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
SessionWithUser >> getUser [
^ user
]

{ #category : #accessing }
SessionWithUser >> model [

^SistemaBookflix soleInstance
]

{ #category : #initialization }
SessionWithUser >> setUser: aUser [
user:=aUser 
]
