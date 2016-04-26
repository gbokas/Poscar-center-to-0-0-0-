#!/bin/bash

# declare a name for this job (replace jobname with something more descriptive)
#PBS -N george 
## request the queue for this job(replace queue with morgan1, izabela1, morgan2, izabela2, izabela3)
#PBS -q izabela2
# Request computational resources for this job as follows
#  nodes- specifies how many nodes to request
#  ppn- specifies how many processors per node to request. Set it as follows:
#    Replace <num> below with 8 for morgan1 and izabela1
#    Replace <num> below with 12 for morgan2, izabela2 and izabela3
#  Request up to 2GB virtual memory per job. 
#PBS -l nodes=7:ppn=8,pvmem=3000mb
# request 48 hours of wall time (for morgan1 max is 96:00:00)
#PBS -l walltime=96:00:00
# combine PBS standard output and error files
#PBS -j oe
#PBS -k eo
# These are PBS standard output and error files.  Uncomment only if you don't want the defaults.
##PBS -o output.$PBS_JOBID
##PBS -e error.$PBS_JOBID

#How many procs do I have?
NN=`cat $PBS_NODEFILE | wc -l`
echo "Processors received = "$NN
echo "script running on host `hostname`"

#cd into the directory where I typed qsub
cd $PBS_O_WORKDIR
echo "PBS_NODEFILE"
cat $PBS_NODEFILE

#If you are not using the general purpose mpiexec, make sure your mpi environment is properly set up such 
#that the correct mpirun is found (you should use the mpirun provided with the compiler
#used to compile the program you are running).
/opt/mpiexec/bin/mpiexec -n 56 vasp5.3.2_gamma



