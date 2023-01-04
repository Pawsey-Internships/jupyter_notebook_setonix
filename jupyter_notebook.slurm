#!/bin/bash --login
#SBATCH --account=<YOUR PROJECT>
#SBATCH --partition=work
#SBATCH --ntasks=1
#SBATCH --time=02:00:00
#SBATCH --job-name=jupyter_notebook
#SBATCH --export=NONE

# working directory
dir="$MYSOFTWARE"

# path to the container (*.sif) file.
imagename=<YOUR CONTAINER>

# node hostname
host="$(hostname)"
port="8888"

module load singularity/3.8.6

echo "************************************************************************"
echo "To access the notebook do,"
echo
echo "ssh -N -f -L ${port}:${host}:${port} $USER@$PAWSEY_CLUSTER.pawsey.org.au"
echo
echo "in a local terminal." 
echo "************************************************************************"

# Launch the container
singularity exec -C  -B ${dir}:${HOME} ${imagename} jupyter-notebook --no-browser --port=${port} --ip=0.0.0.0 --notebook-dir=${dir}
