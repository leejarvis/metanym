Metanym
=======

Search thesaurus.com for Synonyms and Antonyms

Installation
============

	gem install metanym

Usage
=====

	require 'metanym'

	query = Metanym.new 'hello'
	p query.synonyms #=> ["bonjour", "buenas noches", "buenos dias", ...]
	p query.antonyms #=> ["adios", "au revoir", "goodbye"]