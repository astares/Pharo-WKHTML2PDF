# WKHTML2PDF for Pharo

## Project info

The **WKHTML2PDF for Pharo** is a project to provide the possibility to use the [WKHTML2PDF project](http://wkhtmltopdf.org/) from [Pharo](http://www.pharo.org). It allows you to convert HTML into PDF documents.

With this tool you can provide easy portable printing for your Pharo based applications.

### Project location
The project is located on GitHub at [https://github.com/astares/Pharo-WKHTML2PDF/](https://github.com/astares/Pharo-WKHTML2PDF)

### License
WKHTML2PDF is licensed under MIT License.

## Installation

### Install WKHTML2PDF
Please check out [http://wkhtmltopdf.org](http://wkhtmltopdf.org)/ to install the necessary software on your machine. Note that the library/executable should be accessible to Pharo. Often it is enough by providing the binary files next to the Pharo VM executable.

### Install Pharo
Install [Pharo](http://www.pharo.org) on your machine. Pharo 9 onwards is recommended. Either using [PharoLauncher](https://github.com/pharo-project/pharo-launcher) or [Pharo ZeroConf](http://get.pharo.org/):

#### Load Pharo using ZeroConf 

```
wget -O- get.pharo.org/64/90+vm | bash
./pharo-ui Pharo.image
```

#### Load all in one

To install the packages manually into your Pharo image just evaluate:

```Smalltalk
  Metacello new
      baseline:'WKHTML2PDF';
      repository: 'github://astares/Pharo-WKHTML2PDF:main/src';
      load
```


## Use in your own application

### Selecting the engine
Initially you have to select the engine that you want to use. Either you want to use the WKHTML2PDF library or the executable.

```Smalltalk
HTML2PDFConverter useExecutable
```

or 

```Smalltalk
HTML2PDFConverter useLibrary. 
```

The executable is the default.

### Converting
Now you can convert an HTML file or an URL into a PDF document:

```Smalltalk
HTML2PDFConverter 
	convert: 'http://www.pharo.org'
	toFile: 'pharo.pdf'
```

will convert the Pharo homepage to a pdf document.
		
# Packages

- *WKHTML2PDF-Core* - the core package required to use the project
- *WKHTML2PDF-Tests-Core* - includes SUnit tests for the core project

# Testing
The package comes with tests in the package ***WKHTML2PDF-Tests-Core***. Just use the SUnit TestRunner to run them.
