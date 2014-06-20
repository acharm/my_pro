1.先在文件time_config.json里配置好一个时间段(开始时间和结束时间)
2.双击运行zidong.bat


整体过程详细如下:
第一步: 凌晨四点 从城管推送到 中间表(dldata.tostatinfo)
第二步: 再从中间表全表复制过去 分析平台表(dldata.tostatinfowmcq)  (第一步和第二步是由存储过程完成)
第三步: 凌晨六点启动系统定时任务 zidong.bat 检查状态表(dldata.tostatinfo_updateflag)里的标志
第四步: 若为1, 则开始自动更新两个表坐标对应的社区(sqname2_new)
