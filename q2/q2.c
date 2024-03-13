#include <stdio.h>
#include <stdlib.h>

typedef long long int ll;

void rotate(ll* a, ll n);

int main(void) {
    ll n;
    scanf("%lld", &n);
    
    ll* a = (ll*)malloc(n * sizeof(ll));
    for (ll i = 0; i < n; i++) {
        scanf("%lld", &a[i]);
    }

    rotate(a, n);

    for (ll i = 0; i < n; i++) {
        printf("%lld ", a[i]);
    }

    printf("\n");

    return 0;
}
