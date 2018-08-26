pragma solidity ^0.4.20;

contract resnet {
    
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
       // uint16 D2 = K;
       
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
    
    
    
}
