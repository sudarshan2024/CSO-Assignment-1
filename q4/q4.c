#include <stdio.h>
#include <stdlib.h>

typedef long long int ll;

ll sum(ll* a, ll n);

int main(void) {
    ll n;
    scanf("%lld", &n);
    
    ll* a = (ll*)malloc(n * sizeof(ll));
    for (ll i = 0; i < n; i++) {
        scanf("%lld", &a[i]);
    }

    ll ans = sum(a, n);

    printf("%lld\n", ans);

    return 0;
}
