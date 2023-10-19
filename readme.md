# Gordian Book

Gordian Book imports a Twine game (either a Twine Archive, or a Twison/Twee version), and converts it to a gamebook output by numbering and shuffling the paragraphs, and converting links to the appropriate "turn to page x" form. Once converted, you can view the game in the browser, download as a standalone HTML file (e.g. for further editing), or export it as a simple PDF.

# Installation

Gordian Book requires a PHP environment with Composer to install dependencies. Install this repo, and then run composer install to get your dependencies.

It also uses codemirror to provide syntax highlighting while editing. Install a copy of codemirror in js/codemirror

# Run locally with docker

```
docker build -t gordianbook .
```

-v $(pwd):/var/www/html
```
docker run --rm -it -p 80:80 -v "%cd%\bookfonts:/var/www/html/bookfonts" -v "%cd%\bookimages:/var/www/html/bookimages" gordianbook
```
-v "$(pwd):/manim"

Browse to http://localhost


### Adding fonts

1. Put font into `bookfonts` folder

2. Add folloiwng to story stylesheet

```css
@font-face {
    font-family: 'BerkshireSwash-Regular';
    src: url('/bookfonts/BerkshireSwash-Regular.ttf');
}

.paragraph h1, .paragraph h2, .end {
    font-family: BerkshireSwash-Regular;
}
```

The @font-face section is required for the *preview game book option to work*. Note the font-family name must be the same as the font file name without the extension.

### Adding images

1. Put image into `bookimages` folder

2. Reference the image in the story using the folloiwng URl format: http://localhost/bookimages/xxxxxx.yyy where xxxxxx.yyy is the name of the image file.

For example in your `gb-front-cover`` paragraph you might do something like this:

```html
<div class='cover_top'>
    <h1 class='cover_title'>My</h1>    
    <h1 class='cover_title'>Story</h1>
    <img class='cover_image' src="http://localhost/bookimages/bookcoverimage.jpg">
</div>
<div class='cover_bottom'>
    <h2>By<br>AG Writer</h2>
</div>
```html