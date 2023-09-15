Class {
	#name : #MBPostTest,
	#superclass : #TestCase,
	#category : #'MicroBlog-Tests'
}

{ #category : #accessing }
MBPostTest >> testPostIsCreatedCorrectly [
| post |
	post := MBPost title: 'Welcome' text: 'A small blog engine made with Pharo' category: 'MicroBlog'.
	self assert: post title equals: 'Welcome'.
	self assert: post text equals: 'A small blog engine made with Pharo'.
]

{ #category : #accessing }
MBPostTest >> testWithoutCategoryIsUnclassified [
| post |
        post := MBPost
          title: 'Welcome to MicroBlog'
          text: 'MicroBlog is a small blog engine made with Pharo.'.
          self assert: post title equals: 'Welcome to MicroBlog' .
        self assert: post isUnclassified.
        self deny: post isVisible
]
