#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef long long int ll;

#define MAX_LENGTH 10001

ll palindrome(char* s, ll n);

int main(void) {
    char* s = (char*)malloc(MAX_LENGTH * sizeof(char));
    scanf("%s", s);
    ll n = strlen(s);

    ll ans = palindrome(s, n);

    printf("%lld\n", ans);
}
