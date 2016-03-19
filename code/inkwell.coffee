---
---


### `Inkwell`
#
# A little script which embeds screenplays in websites.
#
# Ben Scott
# <bescott@andrew.cmu.edu>
# 2016-03-19
###

'use strict' # just like JavaScript


### const ###
url_regex = /^((ftp|https?):\/\/)?([\d\w\.-]+)\.([\w\.]{2,6})([\/\w \.-]*)*\/?$/


### DOM ###
site = "http://bescott.org" # domain name
#site = "http://localhost:4000" # domain name
baseurl = "/inkwell" # subdomain


### Helper Functions ###
String::startsWith ?= (s) -> @slice(0,s.length)==s
String::endsWith   ?= (s) -> s=='' || @slice(-s.length)==s



### `Inkwell`
#
# main class for Inkwell screenplay includes
###
class Inkwell
    constructor: ->
        script = document.scripts[document.scripts.length-1]
        @parent = script.parentElement
        id = @parent.id
        if id==""
            div = script.previousSibling
            text = div.innerHTML
            @parent.removeChild(div)
            @process(text)
        else @load(id, @getURL(id))


    ### `isFountainHead`
    #
    # Determine if a given line is a fountain block
    ###
    isFountainHead: (line) ->
        return unless (line? && line.length>0)
        return (line.toUpperCase()==line)


    ### `createHeader`
    #
    # create a scene header / slugline, return it
    ###
    createHeader: (lines) ->
        h2 = document.createElement('h2')
        h2.className = "full-slugline"
        h2.appendChild(document.createTextNode(lines))
        return h2


    ### `createCharacter`
    #
    # creates a dl for character / dialogue blocks
    ###
    createCharacter: (lines) ->
        dl = document.createElement('dl')
        dt = document.createElement('dt')
        dt.className = "character"
        dt.appendChild(
            document.createTextNode(lines.shift()))
        dd = document.createElement('dd')
        dd.className = "dialogue"
        for line in lines
            dd.appendChild(
                document.createTextNode(line+"\n"))
        dl.appendChild(dt)
        dl.appendChild(dd)
        return dl


    ### `createAction`
    #
    # creates a paragraph for action blocks
    ###
    createAction: (lines) ->
        p = document.createElement('p')
        p.className = "action"
        for line in lines
            text = document.createTextNode(line+"\n")
            p.appendChild(text)
        return p


    ### `createFountain`
    #
    # creates the appropriate fountain block from the input
    ###
    createFountain: (lines) ->
        return unless (lines? && lines.length>0)
        slugline = /(INT|EXT)(ERIOR)?[\.,]?/
        character = /[ABCDEFGHIJKLMNOPQRSTUVWXYZ\s]+/
        if (@isFountainHead(lines[0]))
            if (slugline.test(lines[0]))
                return @createHeader(lines)
            if (character.test(lines[0]))
                return @createCharacter(lines)
        else return @createAction(lines)

    ### `process`
    #
    # creates the appropriate fountain block from the input
    ###
    process: (data) ->
        data = data.replace(/\n\n+/,"\n\n")
        paragraphs = data.split "\n\n"
        for paragraph in paragraphs
            lines = paragraph.split "\n"
            elem = @createFountain(lines)
            @parent.appendChild(elem) if elem?


    ### `load`
    #
    # get `blob` from an XMLHttp request,
    # and `read` it after it loads
    ###
    load: (id, url) ->
        xhr = new XMLHttpRequest()
        xhr.open('GET',url,true)
        xhr.responseType = 'blob'
        xhr.onload = () =>
            if (xhr.status==200)
                blob = new Blob(
                    [xhr.response]
                    {type: 'text'})
                reader = new FileReader()
                reader.addEventListener "loadend", (event) =>
                    data = event.target.result
                    error = event.target.error
                    @process(data) if error==null
                reader.readAsText(blob)
        xhr.send()

    ### `getURL`
    #
    # determines if `url` is local in a crude and simple way
    ###
    getURL: (url) ->
        return url if (url.match(url_regex))
        return "#{site}#{baseurl}/scenes/#{url}.fountain"




inkwell = new Inkwell()








