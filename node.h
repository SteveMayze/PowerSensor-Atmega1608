/* 
 * File:   node.h
 * Author: Steven
 *
 * Created on 29 June 2023, 16:13
 */

#ifndef NODE_H
#define	NODE_H

#ifdef	__cplusplus
extern "C" {
#endif

    typedef enum node_status_e {
        NODE_STATE_OK,
        NODE_STATE_ERROR
    } node_status_t;
    
    struct node_message {
    };
    
    node_status_t node_intitialise();
    
    struct node_message *node_create_message();


#ifdef	__cplusplus
}
#endif

#endif	/* NODE_H */

