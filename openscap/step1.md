# Software installation and configuration

Red Hat Enterprise Linux (RHEL) provides tools that enable you to perform a fully automated compliance audit. These tools are based on the Security Content Automation Protocol (SCAP) 
standard and are designed for automated tailoring of compliance policies.

OpenSCAP is a standardized compliance solution available in RHEL that comprises of policies and tooling that allow you to scan and evaluate host machines. 

There are 2 terminal tabs that will be used in this lab - a terminal for running the scanner (indicated by *Terminal*), and a second terminal for remediating an issue that is 
found (indicated by *Terminal Remediation*).

Prior to getting started, we need to download the package that consists of the command line interface of the OpenSCAP scanner (*oscap*). OpenSCAP also has a graphical tool called 
SCAP workbench, but in this lab we will only be using the command line tool. We will also download the package that has the SCAP Security guide, which implements security guidance 
rules and remediation scripts by respective authorities, namely PCI DSS, STIG, etc. In this lab we will scan the system against the PCI DSS profile. 

Install the packages to get the oscap and the SCAP security guide packages

`yum install -y openscap-scanner scap-security-guide`{{execute T1}}

After installing, all SCAP Security Guide security policies are in directory */usr/share/xml/scap/ssg/content/*. There are files for every platform available in a form of XCCDF, 
OVAL or datastream documents. In most of use cases, you want to use the datastreams, which filenames end with -ds.xml. SCAP datastreams represent a bundle of profiles which are
used to define a compliance policy.

`ls /usr/share/xml/scap/ssg/content`{{execute T1}}

You can display all available profiles using the info command on the datastream file. In this case, we will be using the rhel8 datastream file 

`oscap info /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T1}}

<pre class="file">
TBD
</pre>