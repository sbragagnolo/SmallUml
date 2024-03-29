Class {
	#name : #ClassDiagram,
	#superclass : #Diagram,
	#category : #'SUML-ClassDiagramModel'
}

{ #category : #'as yet unclassified' }
ClassDiagram class >> inheritanceFor: aClass [
	^(InheritanceDiagramBuilder new buildForClass: aClass ) name: 'Inheritance for ', aClass name
]

{ #category : #'as yet unclassified' }
ClassDiagram >> addDiagramNode: aDiagramNode [
"	(self diagramNodes includes: aDiagramNode) ifFalse:[self halt]."
	super addDiagramNode: aDiagramNode.
	self relateDiagramNode: aDiagramNode.
]

{ #category : #adding }
ClassDiagram >> addNewClassDescriptionNamed: aClassName [
	self addDiagramNode: (ClassBox new boxTitle: aClassName )
]

{ #category : #'as yet unclassified' }
ClassDiagram >> copyNodesTo: anotherDiagram [
	self diagramNodes do:[:diagramNode |
		anotherDiagram addDiagramNode: diagramNode]
]

{ #category : #'as yet unclassified' }
ClassDiagram >> notify: aByteString at: aSmallInteger in: aReadStream [ 
	
]
