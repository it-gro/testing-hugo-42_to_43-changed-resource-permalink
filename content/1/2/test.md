---
title: This is a Test
---

# Test

Given
<pre>
baseURL = "http://example.org/foo/bar"
</pre>

<pre>
myResource.Permalink 
changes from http://localhost:1313/foo/bar/resources/images/...
to http://localhost:1313/resources/images/...
when HUGO_CANONIFYURLS=true is used
</pre>

<pre>
hugo server -w -v
</pre>
versus
<pre>
HUGO_CANONIFYURLS=true hugo server -w -v
</pre>
