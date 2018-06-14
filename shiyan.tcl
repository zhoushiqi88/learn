set ns [new Simulator]
set tracefile [open "|grep \"cbr\" > out.tr" w]
$ns trace-all $tracefile
proc finish {} {
        global ns tracefile
        $ns flush-trace
        close $tracefile
        exit 0
}
set start_time 0.00000000;
set ended_time 20;
set packet_interval 0.05;
set dest_node_num 20;
set dest_node_start 15;
set dest_node_end 34;
set link_num 34;
set node_num 35;
set rng [new RNG]
$rng seed 0
# 创建节点
for {set i 0} {$i < $node_num} {incr i} {
        set n($i) [$ns node]
}
# 创建链路
$ns duplex-link $n(0) $n(1) 2Mb 20ms DropTail;
$ns duplex-link $n(1) $n(5) 2Mb 20ms DropTail;
$ns duplex-link $n(5) $n(15) 2Mb 20ms DropTail;
$ns duplex-link $n(5) $n(16) 2Mb 20ms DropTail;
$ns duplex-link $n(1) $n(6) 2Mb 20ms DropTail;
$ns duplex-link $n(6) $n(17) 2Mb 20ms DropTail;
$ns duplex-link $n(6) $n(18) 2Mb 20ms DropTail;
$ns duplex-link $n(1) $n(7) 2Mb 20ms DropTail;
$ns duplex-link $n(7) $n(19) 2Mb 20ms DropTail;
$ns duplex-link $n(7) $n(20) 2Mb 20ms DropTail;
$ns duplex-link $n(0) $n(2) 2Mb 20ms DropTail;
$ns duplex-link $n(2) $n(8) 2Mb 20ms DropTail;
$ns duplex-link $n(8) $n(21) 2Mb 20ms DropTail;
$ns duplex-link $n(8) $n(22) 2Mb 20ms DropTail;
$ns duplex-link $n(2) $n(9) 2Mb 20ms DropTail;
$ns duplex-link $n(9) $n(23) 2Mb 20ms DropTail;
$ns duplex-link $n(9) $n(24) 2Mb 20ms DropTail;
$ns duplex-link $n(0) $n(3) 2Mb 20ms DropTail;
$ns duplex-link $n(3) $n(10) 2Mb 20ms DropTail;
$ns duplex-link $n(10) $n(25) 2Mb 20ms DropTail;
$ns duplex-link $n(10) $n(26) 2Mb 20ms DropTail;
$ns duplex-link $n(3) $n(11) 2Mb 20ms DropTail;
$ns duplex-link $n(11) $n(27) 2Mb 20ms DropTail;
$ns duplex-link $n(11) $n(28) 2Mb 20ms DropTail;
$ns duplex-link $n(0) $n(4) 2Mb 20ms DropTail;
$ns duplex-link $n(4) $n(12) 2Mb 20ms DropTail;
$ns duplex-link $n(12) $n(29) 2Mb 20ms DropTail;
$ns duplex-link $n(12) $n(30) 2Mb 20ms DropTail;
$ns duplex-link $n(4) $n(13) 2Mb 20ms DropTail;
$ns duplex-link $n(13) $n(31) 2Mb 20ms DropTail;
$ns duplex-link $n(13) $n(32) 2Mb 20ms DropTail;
$ns duplex-link $n(4) $n(14) 2Mb 20ms DropTail;
$ns duplex-link $n(14) $n(33) 2Mb 20ms DropTail;
$ns duplex-link $n(14) $n(34) 2Mb 20ms DropTail;
# 链路队列长度
$ns queue-limit $n(0) $n(1) 500
$ns queue-limit $n(1) $n(5) 500
$ns queue-limit $n(5) $n(15) 500
$ns queue-limit $n(5) $n(16) 500
$ns queue-limit $n(1) $n(6) 500
$ns queue-limit $n(6) $n(17) 500
$ns queue-limit $n(6) $n(18) 500
$ns queue-limit $n(1) $n(7) 500
$ns queue-limit $n(7) $n(19) 500
$ns queue-limit $n(7) $n(20) 500
$ns queue-limit $n(0) $n(2) 500
$ns queue-limit $n(2) $n(8) 500
$ns queue-limit $n(8) $n(21) 500
$ns queue-limit $n(8) $n(22) 500
$ns queue-limit $n(2) $n(9) 500
$ns queue-limit $n(9) $n(23) 500
$ns queue-limit $n(9) $n(24) 500
$ns queue-limit $n(0) $n(3) 500
$ns queue-limit $n(3) $n(10) 500
$ns queue-limit $n(10) $n(25) 500
$ns queue-limit $n(10) $n(26) 500
$ns queue-limit $n(3) $n(11) 500
$ns queue-limit $n(11) $n(27) 500
$ns queue-limit $n(11) $n(28) 500
$ns queue-limit $n(0) $n(4) 500
$ns queue-limit $n(4) $n(12) 500
$ns queue-limit $n(12) $n(29) 500
$ns queue-limit $n(12) $n(30) 500
$ns queue-limit $n(4) $n(13) 500
$ns queue-limit $n(13) $n(31) 500
$ns queue-limit $n(13) $n(32) 500
$ns queue-limit $n(4) $n(14) 500
$ns queue-limit $n(14) $n(33) 500
$ns queue-limit $n(14) $n(34) 500
#设置链路连接状况
set ls(1) 0;
set ld(1) 1;
set ls(2) 1;
set ld(2) 5;
set ls(3) 5;
set ld(3) 15;
set ls(4) 5;
set ld(4) 16;
set ls(5) 1;
set ld(5) 6;
set ls(6) 6;
set ld(6) 17;
set ls(7) 6;
set ld(7) 18;
set ls(8) 1;
set ld(8) 7;
set ls(9) 7;
set ld(9) 19;
set ls(10) 7;
set ld(10) 20;
set ls(11) 0;
set ld(11) 2;
set ls(12) 2;
set ld(12) 8;
set ls(13) 8;
set ld(13) 21;
set ls(14) 8;
set ld(14) 22;
set ls(15) 2;
set ld(15) 9;
set ls(16) 9;
set ld(16) 23;
set ls(17) 9;
set ld(17) 24;
set ls(18) 0;
set ld(18) 3;
set ls(19) 3;
set ld(19) 10;
set ls(20) 10;
set ld(20) 25;
set ls(21) 10;
set ld(21) 26;
set ls(22) 3;
set ld(22) 11;
set ls(23) 11;
set ld(23) 27;
set ls(24) 11;
set ld(24) 28;
set ls(25) 0;
set ld(25) 4;
set ls(26) 4;
set ld(26) 12;
set ls(27) 12;
set ld(27) 29;
set ls(28) 12;
set ld(28) 30;
set ls(29) 4;
set ld(29) 13;
set ls(30) 13;
set ld(30) 31;
set ls(31) 13;
set ld(31) 32;
set ls(32) 4;
set ld(32) 14;
set ls(33) 14;
set ld(33) 33;
set ls(34) 14;
set ld(34) 34;
# 添加UDP流量
# 设置UDP条数

set link_udp_num 0;

# 设置每一条UDP流量的起始与结束时间
for {set i 1} {$i <= $link_num} {incr i} {
        for {set j 1} {$j <= $link_udp_num} {incr j} {
                set u [new RandomVariable/Uniform]
                $u use-rng $rng
                $u set min_ $start_time
                $u set max_ [expr $start_time + ($ended_time - $start_time) * 0.1]
                set udp_t($i,$j) [expr [$u value]]
                set udp_e($i,$j) [expr $ended_time -($ended_time - $start_time) * 0.1]
        }
}
# 设置每一条UDP流量
for {set i 1} {$i <= $link_num} {incr i} {
        for {set j 1} {$j <= $link_udp_num} {incr j} {
                set s_udp($i,$j) [new Agent/UDP]
                $ns attach-agent $n($ls($i)) $s_udp($i,$j)
                set d_null($i,$j) [new Agent/Null]
                $ns attach-agent $n($ld($i)) $d_null($i,$j)
                $ns connect $s_udp($i,$j) $d_null($i,$j)

                set par($i,$j) [new Application/Traffic/Pareto]
                $par($i,$j) attach-agent $s_udp($i,$j)
                $par($i,$j) set burst_time_ 200ms;
                $par($i,$j) set idle_time_ 200ms;
                $par($i,$j) set rate_ 0.1Mb;
                $par($i,$j) set packetSize_ 500
                $par($i,$j) set shape_ 1.5
        }
}
# 添加TCP流量
set path_tcp_num [expr 100]

# 设置每一条TCP流量的起始时间
for {set i 1} {$i <= $link_num} {incr i} {
        for {set j 1} {$j <= $path_tcp_num} {incr j} {
                # 设置起始时间
                set lts [new RandomVariable/Uniform]
                $lts set min_ $start_time
                $lts set max_ [expr $start_time + ($ended_time - $start_time) * 0.1]
                $lts use-rng $rng
                set l_start($i,$j) [expr [$lts value]]
                # 设置结束时间
                set lte [new RandomVariable/Uniform]
                $lte set min_ [expr $ended_time - ($ended_time - $start_time) * 0.1]
                $lte set max_ $ended_time
                $lte use-rng $rng
                set l_stop($i,$j) [expr [$lte value]]
        }
}
# 设置每一条TCP流量
for {set i 1} {$i <= $link_num} {incr i} {
        for {set j 1} {$j <= $path_tcp_num} {incr j} {
            set l_tcp($i,$j) [new Agent/TCP/Newreno]
            $ns attach-agent $n($ls($i)) $l_tcp($i,$j)
            set l_sink($i,$j) [new Agent/TCPSink/DelAck]
            $ns attach-agent $n($ld($i)) $l_sink($i,$j)
            $ns connect $l_tcp($i,$j) $l_sink($i,$j)
            $l_tcp($i,$j) set fid_ 3
            $l_tcp($i,$j) set packetsize_ 500
            $l_tcp($i,$j) set rate_ 0.10Mb

            #将TCP绑定在FTP应用上
            set l_ftp($i,$j) [$l_tcp($i,$j) attach-source FTP]    
        }
}

#产生探测包
set k 1
set Simulation_num [expr ($ended_time - $start_time) / ($packet_interval)]
#每个小包以CBR形式的UDP流发送
for {set i $dest_node_start}  {$i <= $dest_node_end} {incr i} {
        for {set j 0} {$j < $Simulation_num} {incr j} {
                #设置每个包唯一标识符
                set m [expr $i * 100 + $j];
                set udpm($m,$j) [new Agent/UDP]
                $ns attach-agent $n(0) $udpm($m,$j)
                set nullm($m,$j) [new Agent/Null]
                $ns attach-agent $n($i) $nullm($m,$j)
                $ns connect $udpm($m,$j) $nullm($m,$j)
                $udpm($m,$j) set fid_ $k
                #创建一个固定的比特率产生器(CBR)
                set cbrm($m,$j) [new Application/Traffic/CBR];
                $cbrm($m,$j) attach-agent $udpm($m,$j)
                $cbrm($m,$j) set type_ CBR
                $cbrm($m,$j) set packetSize_ 10
                $cbrm($m,$j) set interval_ $packet_interval
                $cbrm($m,$j) set random_ false

                incr k
        }
}
for {set i $dest_node_start}  {$i <= $dest_node_end} {incr i} {
        for {set j 0} {$j < $Simulation_num} {incr j} {
                set randomNum [new RandomVariable/Uniform]
                $randomNum set min_ 0
                $randomNum set max_ $dest_node_num
                $randomNum use-rng $rng
                set this_startTime [expr $packet_interval * $j + 0.00000001 + [$randomNum value] * 0.000000001]
                set this_endTime [expr $packet_interval * ($j+1) - 0.00000001]
                set m [expr $i * 100 + $j]
                $ns at $this_startTime "$cbrm($m,$j) start"
                $ns at $this_endTime "$cbrm($m,$j) stop"
        }
}
for {set i 1} {$i <= $link_num} {incr i} {
        for {set j 1} {$j <= $link_udp_num} {incr j} {
                $ns at $udp_t($i,$j) "$par($i,$j) start"
                $ns at $udp_e($i,$j) "$par($i,$j) stop"
        }
}
for {set i 1} {$i <= $link_num} {incr i} {
        for {set j 1} {$j <= $path_tcp_num} {incr j} {
                $ns at $l_start($i,$j) "$l_ftp($i,$j) start"
                $ns at $l_stop($i,$j) "$l_ftp($i,$j) stop"
        }
}
#结束仿真
$ns at [expr $ended_time + 5] "finish"
$ns run
