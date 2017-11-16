#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define NOREAD "\nQuelldatei konnte nicht gefunden werden"
#define NOWRITE "\nZieldatei konnte nicht geöffnet werden"
#define NOCOPY "\nQuelldatei kann icht auf sich selbst kopiert werden"

int main(int argc, char *argv[]) {

    void upstr(char *s);

    FILE *infile = stdin;
    FILE *outfile = stdout;

    char sbuf[512];
    int i;

    if (argc != 3){
        fputs("Richtige Params angeben", stderr);
        exit(1);
    }
/*
    for(i = 1; i < 3; i++)
        upstr(argv[i]);

    if(! strcmp(argv[1], argv[2])){
        fputs(NOCOPY, stderr);
        exit(2);
    }

    if(strcmp(argv[1], "CON")){
        if((infile = fopen(argv[1], "r")) == NULL){
            fputs(NOREAD, stderr);
            exit(3);
        }
    }

    if(strcmp(argv[2], "CON")){
        if((outfile = fopen(argv[2], "w")) == NULL){
            fputs(NOWRITE, stderr);
            exit(4);
        }
    }
*/
    while(fgets(sbuf, 512, infile) != NULL){
	upstr(sbuf);
        fputs(sbuf, outfile);
    }
    fcloseall();
}

void upstr(char *s){
    int i = 0;

    while (s[i]){
        s[i] = toupper(s[i]);
        i++;
    }
}
