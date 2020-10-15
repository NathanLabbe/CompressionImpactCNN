/*
 * use libjpeg to read an write jpeg format file.
 * 
 * usage:
 * gcc -o jpeg_sample jpeg_sample.c -ljpeg
 * ./jpeg_sample
 */

#include <stdio.h>
#include <jpeglib.h>
#include <stdlib.h>

unsigned char *raw_image = "/home/rob/Téléchargements/pomme.jpg";

int width = 500;
int height = 500;
int bytes_per_pixel = 3;   /* or 1 for GRACYSCALE images */
int color_space = JCS_RGB; /* or JCS_GRAYSCALE for grayscale images */

int read_jpeg_file( char *filename )
{
	struct jpeg_decompress_struct cinfo;
	struct jpeg_error_mgr jerr;

	JSAMPROW row_pointer[1];
	
	FILE *infile = fopen( filename, "rb" );
	unsigned long location = 0;
	int i = 0;
	
	if ( !infile )
	{
		printf("Error opening jpeg file %s\n!", filename );
		return -1;
	}

	cinfo.err = jpeg_std_error( &jerr );

	jpeg_create_decompress( &cinfo );

  

	jpeg_stdio_src( &cinfo, infile );

	jpeg_read_header( &cinfo, TRUE );

  cinfo.scale_num = 1;
  cinfo.scale_denom = 2;

  

	jpeg_start_decompress( &cinfo );
  
	printf("components = %d\n", cinfo.num_components);
  
  width = cinfo.output_width;
  height = cinfo.output_height;

  printf("height = %d\n cinfo = %d\n", height, cinfo.output_scanline);
  
	raw_image = (unsigned char*)malloc( width*height*cinfo.num_components );

	row_pointer[0] = (unsigned char *)malloc( width*cinfo.num_components );
  
	while( cinfo.output_scanline < cinfo.output_height)
	{
    printf("scanline = %d\n", cinfo.output_scanline);
		jpeg_read_scanlines( &cinfo, row_pointer, 1 );
		for( i=0; i<cinfo.output_width*cinfo.num_components;i++) 
			raw_image[location++] = row_pointer[0][i];
	}

	//jpeg_finish_decompress( &cinfo );
	//jpeg_destroy_decompress( &cinfo );
	//free( row_pointer[0] );
	//fclose( infile );

	return 1;
}

int write_jpeg_file( char *filename )
{
	struct jpeg_compress_struct cinfo;
	struct jpeg_error_mgr jerr;
	
	JSAMPROW row_pointer[1];
	FILE *outfile = fopen( filename, "wb" );
	
	if ( !outfile )
	{
		printf("Error opening output jpeg file %s\n!", filename );
		return -1;
	}
	cinfo.err = jpeg_std_error( &jerr );
  
	jpeg_create_compress(&cinfo);
	jpeg_stdio_dest(&cinfo, outfile);


	cinfo.image_width = width;	
	cinfo.image_height = height;
	cinfo.input_components = bytes_per_pixel;
	cinfo.in_color_space = color_space;

  

	jpeg_set_defaults( &cinfo );
  	jpeg_set_quality (&cinfo, 8, TRUE);
  	jpeg_start_compress( &cinfo, TRUE );

	while( cinfo.next_scanline < cinfo.image_height )
	{
		row_pointer[0] = &raw_image[ cinfo.next_scanline * cinfo.image_width *  cinfo.input_components];
		jpeg_write_scanlines( &cinfo, row_pointer, 1 );
	}

	jpeg_finish_compress( &cinfo );
	jpeg_destroy_compress( &cinfo );
	fclose( outfile );

	return 1;
}

int main()
{
  char *infilename = "/home/rob/CompressionImpactCNN/inputImg/pomme.jpg", *outfilename = "/home/rob/CompressionImpactCNN/outputImg/out.jpg";
  
  if( read_jpeg_file( infilename ) > 0 ) 
    {
      if( write_jpeg_file( outfilename ) < 0 ) return -1;
    } else {
    return -1;
  }
  
  return 0;
}