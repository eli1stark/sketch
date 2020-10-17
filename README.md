# sketch

The app takes a sketch of the shoe as an input and returns an image of a similar shoe.

## Model
The model is based on the edges2shoes algorithm which is based on the [pix2pix](https://phillipi.github.io/pix2pix/) algorithm.
- Image size: **256x256**
- Number of training images: **2000**
- Number of epochs: **1**
- Batch size: **1**


[Used dataset](https://www.dropbox.com/s/1ocauh7i6biuka9/shoesnp.npz?dl=0): 2000 training images (256x256). <br>
[Pretrained model](https://www.dropbox.com/s/iy69luldj3ljxvh/shoes_model.zip?dl=0): 1 epoch with dataset above. <br>
[Original dataset](https://people.eecs.berkeley.edu/~tinghuiz/projects/pix2pix/datasets/): 50000 training images. <br>
Recommended amount of epochs with original dataset: **15-30**.

## Results
* [Reference](https://github.com/togheppi/pix2pix#results-1)
* Adam optimizer is used. Learning rate = 0.0002, batch size = 4, # of epochs = 15:

GAN losses<br> ( ![AE0000](https://placehold.it/10/AE0000/000000?text=+) : Generator / ![FF8900](https://placehold.it/10/FF8900/000000?text=+) : Discriminator) | Generated images<br>(Input / Generated / Target)
:---:|:---:
<img src = 'demo/edges2shoes_results/edges2shoes_pix2pix_losses_epochs_15.png'> | <img src = 'demo/edges2shoes_results/edges2shoes_pix2pix_epochs_15.gif'>

* Generated images using test data

    |1st column: Input / 2nd column: Generated / 3rd column: Target|
    |:---:|
    |![](demo/edges2shoes_test_results/Test_result_7.png=60x15)|
    |![](demo/edges2shoes_test_results/Test_result_21.png=60x15)|
    |![](demo/edges2shoes_test_results/Test_result_55.png=60x15)|
    |![](demo/edges2shoes_test_results/Test_result_75.png=60x15)|
