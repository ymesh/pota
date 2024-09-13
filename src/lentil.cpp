#include <ai.h>

AtMutex g_crypto_mutex;

// NOTE: AtCritSec is depricated in Arnold 7.2
// Use std::lock_guard<AtMutex> instead for critical section entry
// std::lock_guard<AtMutex> guard(g_crypto_mutex);

// AtCritSec l_critsec;
// bool l_critsec_active;
// inline bool lentil_crit_sec_init();
// inline void lentil_crit_sec_close();
// inline void lentil_crit_sec_enter();
// inline void lentil_crit_sec_leave();