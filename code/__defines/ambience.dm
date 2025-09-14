#define AMBIENCE_QUEUE_TURF(T) \
	if(!T.ambience_queued) { \
		T.ambience_queued = TRUE; \
		SSambience.queued += T; \
	}

#define AMBIENCE_DEQUEUE_TURF(T) \
	if(T.ambience_queued) { \
		T.ambience_queued = FALSE; \
		SSambience.queued -= T; \
	}