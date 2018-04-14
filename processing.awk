BEGIN {
    max_seq_num = 0;
    sent_packet_num = 0;
    received_packet_num = 0;
    average_delay = 0;
}
{
    if(FILENAME == "out.tr") {
        #定义事件
        event = $1;
        time = $2;
        from_node = $3;
        to_node = $4;
        dst_addr = $10;
        seq_num = $11;
        #处理事件
        if(event == "+" && from_node == "0") {
            sent_packet_num ++;
            start_time[seq_num] = time;
        }
        if(event == "r" && to_node >=15) {
            received_packet_num ++;
            end_time[seq_num] = time;
        }
        
    }
    if(max_seq_num < seq_num) {
        max_seq_num = seq_num;
    }
}
END {
    for(i = 0; i <= max_seq_num; i++) {
        if(start_time[i] < end_time[i]){
            average_delay += (end_time[i] - start_time[i]);
        }
    }
    average_delay = average_delay / received_packet_num;
    loss_rate = (sent_packet_num - received_packet_num) / sent_packet_num;
    printf("%d %d\n",received_packet_num,sent_packet_num);
    printf("%f %f\n",average_delay,loss_rate);
}