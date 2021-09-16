Change directories to /data and start using
the filesystem

`cd /data`{{execute}}

To show the power of deduplication and how it can reduce storage costs 
in your data center,  we will create a file of random data, then make 
several copies of it.               

This dd command will generate a unique 1GB file.

`dd if=/dev/urandom of=/data/file.1 bs=1M count=1000`{{execute}}

When the file completes, we can check the output of          
VDO stats.

`vdostats --human-readable`{{execute}}

<pre class="file">
Device                    Size      Used Available Use% Space saving%
/dev/mapper/vdo1         10.0G      5.0G      5.0G  49%            4%
</pre>

Note: Writing the random data increased the "Used" value by nearly the amount
      written. Because the data was random there was little or no opportunity
      for deduplication, and the space saving was small.
