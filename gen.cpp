#include<stdio.h>
int main()
{
    FILE *fp;
    int x = 1;
    char ch;
    char arr[5];
    fp = fopen("generate.sql", "w");
    printf("Enter data...");
    while( x < 1001 ) {
    	if(x/10 == 0){
    		sprintf(arr,"%d",x);
    		fprintf(fp,"INSERT INTO rekam_medis  VALUES ('RM0000000%s', 'RI0000000%s', 'B00000000%s', ktp,'D00000000%s', TO_DATE('2019-08-05', 'YYYY-MM-DD'), 'gangguan pernafasan');\n",arr,arr,arr,arr);
		}
    	else if(x/100 == 0) //dua digit
    	{
    		sprintf(arr,"%d",x);
    		fprintf(fp,"INSERT INTO rekam_medis  VALUES ('RM000000%s', 'RI000000%s', 'B0000000%s', ktp,'D0000000%s', TO_DATE('2019-08-05', 'YYYY-MM-DD'), 'gangguan pernafasan');\n",arr,arr,arr,arr);
	}
	else if(x/1000 == 0){
		sprintf(arr,"%d",x);
		fprintf(fp,"INSERT INTO rekam_medis  VALUES ('RM00000%s', 'RI00000%s', 'B000000%s', ktp,'D000000%s', TO_DATE('2019-08-05', 'YYYY-MM-DD'), 'gangguan pernafasan');\n",arr,arr,arr,arr);	
	}
	else{
		sprintf(arr,"%d",x);
		fprintf(fp,"INSERT INTO rekam_medis  VALUES ('RM0000%s', RI0000%s', 'B00000%s', ktp,'D00000%s', TO_DATE('2019-08-05', 'YYYY-MM-DD'), 'gangguan pernafasan');\n",arr,arr,arr,arr);		}
	x++;
    	}
    
    // closing the file pointer
    fclose(fp);
    
    return 0;
}
