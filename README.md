# adobe-dng-converter-installer
This script installs the Adobe DNG Converter in wine on linux.

## install_adobe_dng_converter.sh

```
Command Line Options

This script supports the following command line options:
	-p Specifies the $WINEPREFIX, where Adobe DNG Converter should be installed. Else, the default path $HOME/wine-dng will be used.
```

## dngconverter
```
Parameter List

	The parameter list consists of options followed by the names of raw files to convert.
	Options must precede the names of any raw files that they apply to, and apply to all the
	remaining raw files on the command line.

Command Line Options

The Adobe DNG Converter supports the following command line options:
	-c Output compressed DNG files (default).
	-u Output uncompressed DNG files.
	-l Output linear DNG files.
	-e Embed original raw file inside DNG files.
	-p0 Set JPEG preview size to none.
	-p1 Set JPEG preview size to medium size (default).
	-p2 Set JPEG preview size to full size.
	-fl Embed fast load data.
	-lossy Specify lossy compression. Defaults to preserve pixel count.
		Specify a long-side pixels or megapixels limit with optional
		-side or -count options defined below. Valid for Camera Raw
		compatibility 6.6 or later.
	-side <pixels> Specify a long-side pixels value from 32 to 65000 pixels.
	-count <pixels> Specify a megapixels limit of 1024 (1MP) or greater.
	-cr2.4 Set Camera Raw compatibility to 2.4 and later
	-cr4.1 Set Camera Raw compatibility to 4.1 and later
	-cr4.6 Set Camera Raw compatibility to 4.6 and later
	-cr5.4 Set Camera Raw compatibility to 5.4 and later
	-cr6.6 Set Camera Raw compatibility to 6.6 and later
	-cr7.1 Set Camera Raw compatibility to 7.1 and later (default)
	-dng1.1 Set DNG backward version to 1.1
	-dng1.3 Set DNG backward version to 1.3
	-dng1.4 Set DNG backward version to 1.4 (default)
	-x Extract original embedded raw file(s) from source file argument(s).
		Overrides options above.
	-d <directory> Output converted or extracted files to the specified directory.
		Default to the parent directory of the input file. In the case of
		multiple input files, it defaults to the parent directory of each file.
	-o <filename> Specify the name of the output DNG file.
		Default is the name of the input file with the extension
		changed to “.dng”.
		When converting multiple files with a single command,
		output files will use this as a base name and will be numbered
		sequentially. Ignored when using -x option.
```

## Literature

1. [https://rawpedia.rawtherapee.com/How_to_convert_raw_formats_to_DNG](https://rawpedia.rawtherapee.com/How_to_convert_raw_formats_to_DNG)
2. [https://github.com/jarnoh/adobe-dngconverter-docker](https://github.com/jarnoh/adobe-dngconverter-docker)