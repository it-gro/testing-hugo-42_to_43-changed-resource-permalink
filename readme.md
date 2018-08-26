Issue
=====

Sind hugo 0.43.0 the Permalink for a resource image does no longer include the
subdir parts of the BaseURL.


To run this test we need in PATH

* hugo-0.42.2
* hugo-0.43.0
* hugo-0.47.1


#### working fine:

`hugo-0.47.1 server -w -v`

`HUGO_CANONIFYURLS=true hugo-0.42.2 server -w -v`

#### issue with

`HUGO_CANONIFYURLS=true hugo-0.43.0 server -w -v`

#### compare the results

`compare.sh`

* root   : baseURL=https://example.com
* subdir : baseURL=https://example.com/foo/bar

All resources are in or below subdir

=>

diff -r public/0.42.2/root public/0.43.0/root
diff -r public/0.43.0/root public/0.47.1/root

diff -r public/0.42.2/subdir public/0.43.0/subdir
diff -r public/0.43.0/subdir public/0.47.1/subdir


Outputs:

```

diff -r public/0.42.2/subdir/canonify_true/foo/bar/1/2/test/index.html public/0.43.0/subdir/canonify_true/foo/bar/1/2/test/index.html
49c49
< myResource.Permalink              : https://example.com/foo/bar/resources/images/teaserpics/pixabay.com/adventure-2528477_640.jpg <br/>
---
> myResource.Permalink              : https://example.com/resources/images/teaserpics/pixabay.com/adventure-2528477_640.jpg <br/>
52c52
<   src='https://example.com/foo/bar/resources/images/teaserpics/pixabay.com/adventure-2528477_640_hu30e96e65c77ee702b7193f618ab3b541_100786_300x0_resize_q75_box.jpg'
---
>   src='https://example.com/resources/images/teaserpics/pixabay.com/adventure-2528477_640_hu30e96e65c77ee702b7193f618ab3b541_100786_300x0_resize_q75_box.jpg'
56,57c56,57
<                data-dbg-myResource-Permalink='https://example.com/foo/bar/resources/images/teaserpics/pixabay.com/adventure-2528477_640.jpg'
<                   data-dbg-myImage-Permalink='https://example.com/foo/bar/resources/images/teaserpics/pixabay.com/adventure-2528477_640_hu30e96e65c77ee702b7193f618ab3b541_100786_300x0_resize_q75_box.jpg'
---
>                data-dbg-myResource-Permalink='https://example.com/resources/images/teaserpics/pixabay.com/adventure-2528477_640.jpg'
>                   data-dbg-myImage-Permalink='https://example.com/resources/images/teaserpics/pixabay.com/adventure-2528477_640_hu30e96e65c77ee702b7193f618ab3b541_100786_300x0_resize_q75_box.jpg'

```
