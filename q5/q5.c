#include <stdio.h>
#include <stdlib.h>

typedef long long int ll;

ll product(ll* a, ll n, ll* ans);

int main(void) {
    ll n;
    scanf("%lld", &n);
    
    ll* a = (ll*)malloc(n * sizeof(ll));
    for (ll i = 0; i < n; i++) {
        scanf("%lld", &a[i]);
    }

    ll* ans = (ll*)malloc(n * sizeof(ll));
    
    product(a, n, ans);

    for (ll i = 0; i < n; i++) {
        printf("%lld ", ans[i]);
    }

    printf("\n");

    return 0;
}
