#include <stdio.h>
#include <stdlib.h>

typedef long long int ll;

ll lonely(ll* a, ll n);

int main(void) {
    ll n;
    scanf("%lld", &n);
    
    ll* a = (ll*)malloc(((2 * n) + 1) * sizeof(ll));
    for (ll i = 0; i < (2 * n) + 1; i++) {
        scanf("%lld", &a[i]);
    }

    ll ans = lonely(a, n);

    printf("%lld\n", ans);

    return 0;
}
