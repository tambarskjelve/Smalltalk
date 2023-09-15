Class {
	#name : #BaselineOfSmalltalk,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmalltalk
}

{ #category : #loading }
BaselineOfSmalltalk class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'Smalltalk' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfSmalltalk >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Microblog'
		]
]
