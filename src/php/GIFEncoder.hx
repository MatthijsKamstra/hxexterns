package externs.gif;

/**
haxe externs for

*/

/*
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::	GIFEncoder Version 2.0 by László Zsidi, http://gifs.hu
::
::	This class is a rewritten 'GifMerge.class.php' version.
::
::  Modification:
::   - Simplified and easy code,
::   - Ultra fast encoding,
::   - Built-in errors,
::   - Stable working
::
::
::	Updated at 2007. 02. 13. '00.05.AM'
::
::
::
::  Try on-line GIFBuilder Form demo based on GIFEncoder.
::
::  http://gifs.hu/phpclasses/demos/GifBuilder/
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*/

extern class GIFEncoder
{

	/*
	<?php

header ('Content-type:image/gif');
include('GIFEncoder.class.php');

$text = "Hello World";

// Open the first source image and add the text.
$image = imagecreatefrompng('source01.png');
$text_color = imagecolorallocate($image, 200, 200, 200);
imagestring($image, 5, 5, 5,  $text, $text_color);

// Generate GIF from the $image
// We want to put the binary GIF data into an array to be used later,
//  so we use the output buffer.
ob_start();
imagegif($image);
$frames[]=ob_get_contents();
$framed[]=40; // Delay in the animation.
ob_end_clean();

// And again..

// Open the first source image and add the text.
$image = imagecreatefrompng('source02.png');
$text_color = imagecolorallocate($image, 200, 200, 200);
imagestring($image, 5, 20, 20,  $text, $text_color);

// Generate GIF from the $image
// We want to put the binary GIF data into an array to be used later,
//  so we use the output buffer.
ob_start();
imagegif($image);
$frames[]=ob_get_contents();
$framed[]=40; // Delay in the animation.
ob_end_clean();

// Generate the animated gif and output to screen.
$gif = new GIFEncoder($frames,$framed,0,2,0,0,0,'bin');
echo $gif->GetAnimation();

?>
	 */

/*
$fp = fopen('animegif.gif', 'w');
fwrite($fp, $gif->GetAnimation());
fclose($fp);
 */


/**
<?php
    include "GIFEncoder.class.php";
    for($i=1;$i<6;$i++){
        $imgname = "images/".$i.".jpg";
        $im = @imagecreatefromjpeg($imgname); // Attempt to open 
        imagegif($im, "images/".$i.".gif");
        $frames[] = "images/".$i.".gif";
        $time[] = 200;
    }
        $gif = new GIFEncoder   (
                                $frames, // frames array
                                $time, // elapsed time array
                                0, // loops (0 = infinite)
                                2, // disposal
                                0, 0, 0, // rgb of transparency
                                "url" // source type
            );
 
// display the image
Header ( 'Content-type:image/gif' );
echo    $gif->GetAnimation ( );

    for($i=1;$i<6;$i++){
        @unlink("images/".$i.".gif");
    }
?>

  */
    static function __init__():Void untyped {
        __call__("require_once", "GIFEncoder.class.php");
    }

	// Generate the animated gif and output to screen.
	// $gif = new GIFEncoder($frames,$framed,0,2,0,0,0,'bin');
	
/*

                            $frames, // frames array
                            $time, // elapsed time array
                            1, // loops (0 = infinite)
                            0, // disposal
                            3, 2, 1,
                            0,// rgb of transparency
                            "url" // source type
 */
	public function new(pGIF_src:Array<Dynamic>, pGIF_dly:Array<Int>, pGIF_lop:Int, pGIF_dis:Int,pGIF_red:Int, pGIF_grn:Int, pGIF_blu:Int, pGIF_mod:String):Void;

	// private function GIFAddHeader ( ):Void ;

	// private function GIFAddFrames ( pi, pd ):Void;

	// private function GIFAddFooter ( ):Void;

	// function GIFBlockCompare ( pGlobalBlock, pLocalBlock, pLen ) ;
	
	// function GIFWord ( pint ) ;
	
	function GetAnimation ( ):Dynamic ;
} 