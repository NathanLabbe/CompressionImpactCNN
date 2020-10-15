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
#include <dirent.h>
#include <string.h>

unsigned char *raw_image = "/home/rob/Téléchargements/pomme.jpg";

int width = 500;
int height = 500;
int bytes_per_pixel = 3;   /* or 1 for GRACYSCALE images */
int color_space = JCS_RGB; /* or JCS_GRAYSCALE for grayscale images */
int SCALE = 1;
int QUALITY = 1;

int qualities[] = {1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 16, 18, 20, 25, 30, 40, 50};

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
  cinfo.scale_denom = SCALE;

  

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

	jpeg_finish_decompress( &cinfo );
	jpeg_destroy_decompress( &cinfo );
	free( row_pointer[0] );
	fclose( infile );

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
  	jpeg_set_quality (&cinfo, QUALITY, TRUE);
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

 DIR *folder;
    struct dirent *entry;
    int files = 0;

    folder = opendir("./inputImg/");
    if(folder == NULL)
    {
        perror("Unable to read directory");
        return(1);
    }

    while( (entry=readdir(folder))  )
    {
		if (strncmp((entry->d_name), ".", 1) != 0)
		{
			for(int i=1; i<=8; i=i*2)
			{
				SCALE = i;

				char scaleString[2];
				sprintf(scaleString, "%d", SCALE);

				char *imgBase = entry->d_name;
				char imgName[strlen(imgBase)-4];
				strncpy(imgName, imgBase, strlen(imgBase)-4);
				char inName[50];
				strcpy(inName, imgBase);

				char infilename[255] = "/home/rob/CompressionImpactCNN/jpeg/inputImg/";
				strcat(infilename, inName);

				
				for (int j = 1; j< sizeof(qualities)/sizeof(qualities[0]); j++)
				{
					QUALITY = qualities[j];

					
					char qualityString[2];
					sprintf(qualityString, "%d", QUALITY);
					
					char outName[50];
					strcpy(outName, imgName);
					strcat(outName, scaleString);
					strcat(outName, "_");
					strcat(outName, qualityString);

					char outfilename[255] = "/home/rob/CompressionImpactCNN/jpeg/outputImg/";

					strcat(outfilename, outName);
					strcat(outfilename, ".jpeg");
					printf("in = %s\n", infilename);
					printf("out = %s\n", outfilename);
					
  					if( read_jpeg_file( infilename ) > 0 ) 
    				{
      					if( write_jpeg_file( outfilename ) < 0 ) return -1;
    				} else {
   						return -1;
  					}
				}
			}
		}
    }

    closedir(folder);

    return(0);
}