pragma solidity ^0.4.20;

contract resnet {
    // log
    event logging(uint32);
    
    function convNextLayer(uint16 W1, uint16 H1, uint16 F, uint16 S, uint16 P)
    returns(uint16 W2, uint16 H2) {
       return ((W1 - F + 2*P) / S + 1, H2 = (H1 - F + 2*P) / S + 1); 
    }
    
    // Number of filters    : K
    // Dimension of filters : F
    // The stride           : S
    // The amount of padding: P
    function conv(uint16 W1, uint16 H1, uint16 D1, uint16 K, uint16 F, uint16 S, uint16 P)
    returns(uint16 W2, uint16 H2, uint16 D2) {
       var (_W2, _H2) = convNextLayer(W1, H1, F, S, P);
       
       // Loop num.
       emit logging(uint32(_W2 * _H2 * K) * uint32(F * F * D1));
       
       uint32 i;
       uint32 j;
       
       for(i=0; i<_W2 * _H2 * K; i++){
           uint32 sum=0;
           
           for(j=0; j<F * F * D1; j++){
               // fixed point mul.
               sum += (3/4 + 1/2*1/2);
           }
       }
       
       return (_W2, _H2, K);
    }
    
    function relu(uint16 W1, uint16 H1, uint16 D1)
    returns(uint16 W2, uint16 H2, uint16 D2) {
        uint8 tmp=0;
       
        // Loop num.
        emit logging(uint32(W1 * H1 * D1));
        
        uint32 i;
        
        for(i=0; i<W1 * H1 * D1; i++){
            // max
            if (tmp < 0){
                tmp = 0;
            }
        }
        
        return (W1, H1, D1);
    }

    // average POOL
    function pool(uint16 W1, uint16 H1, uint16 D1, uint16 F, uint16 S)
    returns(uint16 W2, uint16 H2, uint16 D2) {
        uint16 _W2 = (W1 - F) / S + 1;
        uint16 _H2 = (H1 - F) / S + 1;
        
        // Loop num.
        emit logging(uint32(_W2 * _H2 * D1 * F * F));
        
        uint32 i;
        uint32 j;
        
        for(i=0; i<_W2 * _H2 * D1; i++){
            uint32 sum=0;
            
            for(j=0; j<F * F; j++){
                sum += (1.5 + 1.5);    
            }
            
            sum /= (F * F);
        }
        
        return (_W2, _H2, D1);
    }    
}
