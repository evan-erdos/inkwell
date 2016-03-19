---
---

# Ben Scott
# <bescott@andrew.cmu.edu>
# 2016-03-15

### Inkwell
#
# A web parser for the Fountain markup language
###

'use strict' # just like JavaScript


### const ###
url_regex = /^((ftp|https?):\/\/)?([\d\w\.-]+)\.([\w\.]{2,6})([\/\w \.-]*)*\/?$/

### DOM ###
#site = "http://bescott.org" # domain name
site = "http://localhost:4000" # domain name
baseurl = "/inkwell" # subdomain


### `InkwellLoader`
#
# finds Fountain source at some URL,
# then puts it where `Inkwell` can find it
###
class InkwellLoader
    constructor: ->
        inputs = document.getElementsByClassName "screenplay"
        values = (input.id for input in inputs)
        @load(value, @getURL(value)) for value in values


    ### `read`
    #
    # puts the raw source in the `tgt` div
    ###
    read: (data, src, tgt) ->
        text = data.replace(/\n\r?/g, '<br />') if data?
        tgt.innerHTML = text;
        #tgt.appendChild(
        #    document.createTextNode(text)) if text?

    ### `load`
    #
    # get `blob` from an XMLHttp request,
    # and `read` it after it loads
    ###
    load: (id, url) ->
        src = document.getElementById(id)
        tgt = document.getElementById("inkwell-#{id}")
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
                    @read(data,src,tgt) if error==null
                reader.readAsText(blob)
        xhr.send()

    ### `getURL`
    #
    # determines if `url` is local in a crude and simple way
    ###
    getURL: (url) ->
        return url if (url.match(url_regex))
        return "#{site}#{baseurl}/scenes/#{url}.fountain"

inkwellLoader = new InkwellLoader()








