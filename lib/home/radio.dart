import 'package:flutter/material.dart';

class radio extends StatefulWidget {
  const radio({super.key});

  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 21,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Radio',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                'https://media.istockphoto.com/id/157191109/photo/80s-boombox.jpg?s=612x612&w=0&k=20&c=vt_1ejHYTG9xlou7ad9mr9Na24d8RGCQbym2sRRDHJw=',
              ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Add to your favourite radio playlist',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'New Radio playlist',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 3)
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                        fit: BoxFit.cover,
                        height: 120,
                        width: 110,
                        image: NetworkImage(
                            'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBQVFBgVFRQZGRgaGxsbHBsbGhgZIRobGBoaGhsbGx0bIS0kHCEqIRkYJTcmKi4xNDQ0GiM6PzoyPi0zNDEBCwsLEA8QHRISHzMrJCozMzMzMTMzMzM1MzMzMzMzMzMzMzMzMzM2MzMzMzMzMzQzMzM1MzMzMzMzMzMzMzMzM//AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBAMBAAAAAAAAAAAAAAAAAwQFBgECBwj/xABDEAACAAQDBAcGAwcCBQUAAAABAgADESEEEjEFQVFhBhMicYGRoTJCUrHB0Qdi8BQVI4KS4fFyojM0U7LCFiRzo7P/xAAaAQADAQEBAQAAAAAAAAAAAAAAAgMBBAUG/8QALhEAAgEDAwIEBQUBAQAAAAAAAAECAxEhEjFRBEETIjJhFHGBocEjUpGx8fBi/9oADAMBAAIRAxEAPwDrUEYjMOARiCCAAjMYjMABBBBAAQQQQAEEAgEAGYQm4WW/ty0Y/mVT8xCkyZQRBbR26ENFW4Fe1VacdRwvGN2NUbkm8uVLBZURCN4VR8hFd2vt+ZLLNLKso9oG2U8iN/Ec9Yq21ekMx2NbEc7UpvrSn6EQWN2wxTLn7NjQ7zx5mISqX2LQp23LU/TcLMV0VqUqyEihbQ5eFvIgag2m9tdJpcyUolNXOQa6UFNDwNTTwjjTOSbesO8NipiVFbHdWlDuI5wqqNblHTiy+4efm07qC9Twh3MOUEb954cvvHPsPjSGrcHfqIsGzdstmUMpcAg0GrUNac+cNGfIOGlOx1HZ2zZaS0Dy0L5asSqk1NzcjdWnhDxMLLU1WWgPEKoPoITwMzOucijEC3wg3A/vvhzF0cjK/wBKaoEmrzlk8A9CD5iK3KQuaDxPCLttvC9Zh3Qa5SR3rcfKKzhlGUZdCK99bxKba23Z1dNTU29TwsszIlBbD/MLYvGdWtF9r5RpLBJou7Vt3cPvCPUjNU7tPvFNUaUbL1MjVm+sqKEcQj/12I4fCljme5O7j3xNLNWSmZvaP6oIaCYEGY3O4feIifOeY97nhuAhoQt5pZb2XBKtVVT9KliK3fJnHYxprVbwESuw9iFyHmDmF+8K7E2PXttpxOlOUG2dvAAypFhoX48l+8ElbD3JR83ljiK78jzbO21lAy5VC+hO5f7xWZOHaZWZMai1qWOp7o3l4dZYzzNTcJvP+rl+uUIYjEs5qdBoBoBGabZY+pyWmnhcm+IxVRkljKg825mGgjYmNQIRu5WEFFWRiCNqQQDHToIZ7L2lLnpnQ0p7SnVTz5c4hNq9KQpKSAGpYudP5Rv7z6xQmWekFI5xiNq4hz2pz9wJUeS0EaS9pT1us5/F2PobQAdKgiobN6VuCFnDMPjUUI5lRY+FPGLZKmK6hlIZSKgjQwAbwCCMwAYgMZgMAAIIBCOJmZV1gAjdt7UWUtfmaa6V5WPlHM9qbaqGJarEk7+PDQAigp/iHfTDahd3VTYWB7h56kxUJd6UvxJvHNUndnVThZG8/Elrm5OnhasM3ksbNrFll4Hsh2BIsAN7tw5ARD4rMHpTnb9aRDUX0DCbLyEXB7qxjOT3DjugdGZr3vC8mXfhGtgo3ExWxrCkqeUax03wFKbt9DCE1SPA+kamLKNi+9H+m7oEWYobKtM1aEoBaooc1CPnxjpeydopiJazUrQ8RSh3jn3x55RwGqOUXrodt6aktZavQBwaUr2K1YLXU3Nhru0i0JtYZCpTW6OsUinphiHeXoqMQTvIPaVRwFCIuCkEVFwbgxX9sHq52fdMl0qdzIfsx8orNtK6Odwc/Kna42nsEXKLfSGssljYd33MNw7TWoulf0T9ok1RZa0Gu87zzicY6cvf+h6m3w9H6vn5jXEpYqDf3mO7kOcO9l7LQL1kzsoL9rVuZhRJMuWvWzrLqqb2PMRE43HTMS16Kg3aKo4niYvFyWFlvuTlCFNab47vkW2pth556uUKJoALFuZ4CGfZlaUeZx91O7iY0aeFBWVUDe+9u7gIakQYj7vkTS574XHIO5JJYkk6kxiAwCJsuklhGI0jcwthsIz39leJ+kYPCEpOyQ2rBD/NIFqV53vGYLl/h/8A0v5I6XMZc2ViMwymhpVd4PK0aiHGOxPWTGmZQub3RoKACgsOEGzsN1s1Je5mAPdqfGgMUOIWwOyJ04Vlp2fiJCjwrr4QrjNg4iWpYpmUalCGp3jX0joCIFAVQAAKADQAaARsI0w5SInui20zLmCWx7Dmg/K50I79D4Qn0pwSyp9VFFcZqDc1SGp6HxiFLEXFiNDwI0MBp1UwRpKfMqt8QB8xWN4ACCCCAAMVnpDNYZaUN7qSKaa13Hvt3axZHFjHPenCOGRg1ipDV0sbUIGtzY8Od1m7IemrspG2n/iMAeP6+cLScJdZYHaYX7zQAeFfnEdObtaf4AiZwLdpHPu/KlB8hHDNnfTiSuImBQBamlSba3vwPrSE58uW1rX7xXvoKnu9YYS5ZmTAToTYcBuifk4QaUA47zzr+t8TLqJCYrY+TSvgCBDeds8AaGp5UtxvFuGHUZmy8lF68zrGmKwtVVAAPioKcrn0jbDrBQzhyTpaoHf+qRpNwZIJp+jSLScBVrDTTgOZ5m/nCs7AFJdgMx05U/yTAriyiijYiUVNOBp5CHGAxjSwxT2iKb7HiP1pD3G4Kgrvr51qSfSIsWIpFIyOacDvfR/GSpshDKYlVVVoa1WgpQ1327oR6UYbPIJ3oQ1eA0Y+Ris/hxjmKsjJQVqrC1zWoYaUOopvGnaqb3PlB0ZDowI8xSOyLujgkrSK9Iw6ykCgVY7t5PE/aNJ2ISV2n7czUJw5tDH9vZRkWpmeyzHcRY08obOolkljnc31rTmecZGDf5Y0qkaUdFPLe77s1xMxpp6yaxpu7uCjdCMycWGUDKo0UfM8TGHYm5uYTisppLTH/SUYZvL/AAzWNaxkiMExIqYMbSpZY0UEnlDzCbOZxmY5E+I/SFJmPSWCkkd7HUwjn2W48Yd5YRgYVJQrMOZtyi/+YZ4nFNM5LwEJM5JqTUnjGBLtVjQevgIaFOUmNOtZWjhf2JWgheo3SSed7+kEX8KPJy+KICFsFiermJM1yMCRxG8eVYzIwcx0eYiErLHaP240FzwEIQhp0XHq82VmkTCrEZlYUo35TXj6HxikvtjFAkGa4INCLAgixBtCeB2lNk/8OYQDqLFa8aHfzhPG4ppjl3pmNKkACtN5pvjQNsZj5k3J1jZioK13mpJvzvTwhoQd2v1jMTPRjZ/Wzs5pll0Yji18opwqK+HOMAvEmXlVV+FQPIUjeCCNAIzGICYAGmPJyNQ0NCBel6cd0c96Q4wmWw63PcDLRwRpxYiLntmc9CBlIIpQjjvqd3hFD6RMxqK1IS2g1J9lRoDQeURqysWpRuU9bsRw/X0iWwCWIIN68+fzHrEUlK86edP8RZdkpmAB43+scjV2ehDYxg1KsKKWY2C8bVud2sWfA4JwtWu3ARthpaJVqCp1P2hZtpqppS3GBRSKahbD4Vq5nIqdw0A3CNXk3NBVjvOgEKycSH0vBiMRkBNo3AXG4wOUd27nz4whi5ZZaaRo216m5UDnQRlsRmFqEciIMGNlX2rICZieBpviqqt4uG3jbviq9X2wIVbiS2Ojfhs/tJ+W/nb0+QjoMUz8OsIBKM3exZT/ACkU/XOLlHdT9J5lT1Mpm2/4U9woA6yjg+jAeIHnEXFm6YSOwkz4TlPc2nqBFZjW3sLGKWTWAwGHmFwJYZ3OROJ39whJSS3HSuNZMtmbKoqeUSAkS5N5lHfco0HfGk3HhRkkjKN7e8Yj6EneTGWlL2Qyxtli2LxrzD2jbco0EN1QnTTjCrSwPau3wiJHDbJd7zewnwjXx4RenSEq1Y08zeeCNlSyxyoMzceH2iawewwO3OYHlu/vCjY+VKGWWoJ/XnDJ2mzbscq8YpKajj7HC5VK22ES/wC8cOtqac4IhP2STxYwRO9Xg34Vc/YvGHlKihEUKo0AiA2r0XVyXkkITqh9k91PZ9R3RYoIDqOdz9i4lDeSx5qM/wD21jRNk4hrCQ/irL6tSOkQVgMKA/R3FAA9WDWtgy1XvqaeVYW2dszGSZgdJRtYjMlGU6qe1+rReYxAaYRqgGhFdxpUcjSMwQQAEZggMBgw2mxCEju00rvjne0HzllpSu868Lx0PanalsBqfWOa498jHNQMSDeugrWhpTcfOIVVdHRQklLJXBL/AIhpoCfKpA+YizbJwTBf1uiHeXSZ30r8/mItuzD2RHMj0ErYGuJwc5lYLMymnZpbS9zre4hfZ+yCJbCaQXJqDmchRQAi978KxMSwI3mixMMpWVgcFe5E4VcjlVJy6ivfDmfR2Aa66kcYYynLTDDnEEqQeEYN2FcVgUeW0vcxBzAAEFWDDlSwFIi8J0fWWKAtXMWzXB0/tvrFhw5qoMZcAQanawqgr37ld2pgai5rl0+d4rJwnaJAqQdPOLrtA9kxWsDKmTJhWXQO9UUmwBIIqe7WMtkybsjoHQfDlMGhPvkv3BqAegEWCE8PLCoqqKAKAALaCFI74qyseVJ3dxltjDdZJdN+Ukd4uIouGRnICgkndw7+EdHijY3EGTMeUgC0Zjm3kMaj508ISd+xsTbJKk+3R3+EaL3wyxWKaYase4bh3CNJctnuNN7HT+8LyyK5ZSmY/HhCwp5u9yyhi8sITWRbM5yj1MOMHhZk3sy1ypvcw5GFlyu3iHzPulg/OMtip08ZUAly+XDv3+EX8sdznqV7Yhhcv8CnWYfDWX+JM463+kIP103tTDkTcNPTf4xvh5cuX7Azv8R0H65RrPmDV2qeH2EY5t+yFodFKo9TwuX+EYlIi+wMx4nSMPOX32r+twhpiMUx/KIZirGigk8BUmBTjHKOuUYwVorPL/BJfvJBotYITTZE+n/DPnGYX4r3RDRLll+ggghhQggggAIIIIACMxiMwGBGHMZhKcaCBgRmPmC9xFX25s0TpTqLNSqnnrE9jXufvDOJsZHN9mzyVIb25djXgND9PARbNmPYRDdLcCJR69AA7HKaVAFd5G898PthzM8tTxUHxpf1rEJxtk7qVTUkuCzyGEZxTHI1NaGnlDbDPxjE3GJXLmAO+8ROnUQuG2kktxVGy77HUQ7xG0+sIyS2K76A+kPP2iSbFgfWNTjJCWDgd0bkbSx9giQgBtbThWN5z2iPl4+WxojZ+Sgk+NNIczycsYZewxxpqph50V2CrKJkxLAhkrbtVqH7hanGsM8cKIe6LxgZeWWi/Cqr/SKRenFN3OTqJuKtyLwQQR1HCEVbpTh1ExJjKWDLloN7LcV8KxaYiukkktIZl9qWQ4Pdr6ExjGhLTJMq82TWhmtkTci6mN0xxI6uQmUcd/iYZ4bCtMu2nGJNcktaWA+cbqsuDo8OdV3S+r2NZWEVTmmHO3D7wrOmVHaNF+Efq8ILNZvYFB8RjeRILGiKXbjuHjHPKqlsWh01Kn5pO75f4RqzmluwvE6+AhqgLmktCx46n+0Ta7IUdqe9fyDSCdtNEGSWoUcheI+I5OyybUquXsuRlK2F7058v5RrD5JsuUKIoXmbkxD4jaLk/qsR7zmO+Kqnf1P6HK6i2jn3LD+9l+M+sEVmkEPphwR8/wC5nUoIZ4DaUqcCZb1I1U2I7wfnpCmNxkuUueYwUaDeSeAAuYsYOIxEPJ6S4ZjTOV5stB5ioHjErPmqilnYKo1J0gA3giITpLhSadYRzKMB8olUcMAykEEVBBqCDoQYANozGIzAYEN8QhIhxCc3SBmkDipdIYTZiopZyFUak7okscY5x0n2kZkwy1PYlmn+phYk91wPHjEzTTpVt0TpbSpadnXM2ppwG7x9IadBdp9ky21Q2/0tf519IYObRrJlrImKxqKi9OJFSOfdxhZrFitJ2dzpMpwGrCuLw8ubTMqmnEA/OIDDbR917MPWJHD40HQ34Rys9BMVXZIF1Cf0iFF2cx1ygclEOcNPDamHEyetNbwXZTW7biEiUJcYnzAfCGuJxoW5MROJ2uAKC5O6NJtkxh062ciC4BzseSkW8TQRd5ekcfwu0ZkqejVyu1StdHC0zJzsRUcwY65gMSsyWkxdGFacDoQeYII8I6qasjz68tUheCCCKkQjWYgZSp0II842ggAoJmzA3VBboSpP+mwPjSvjDrC7KdiC1Wb0ES8+WqYh6izhXHf7L/JPOEcRtM+ynp945Kjeqx2wqycfZd3t9BVdnol5jVp7i6eMaT9qADJLXKOCj67oZMjHtTGoPKG03aKL2ZS5jx+w3wip6nk5anVK/lV3y9hxNzHtO1B3/WI2fil0QeMLrs6dNOaYcg/N9FhfqcNJFWOdh8V/9o+sdMKViaU6mZZ/pERJw0yZ7Kk89B5w9GzQorMfwGnmfpC8zacyZaWlBxNvIQ0mJvmTCx4CH8kfU7+yLx6eo1fZGc0kfD8/rGI17O6WIIzxo/tQeDH9wrj5RwWJBRiQKOK6lDUFTx0YeUSHTaU/WS3vky5QdwbMSa8KjL5coYypczG4jMVots1NEQe7XeTfxJOkWLbm3Ekussy8+YVcHTKbClRQmvyhiJH7HGBmOhVSjqbK7Ehm3XJo17jQ20hx01luZaEAlFYluVRRSeWo8Yre1Zkl3BkS3QHVT8RNsoBNP1aLdtDav7PJl9YueYyqCp30Azkm/wDkxphA7KlYGYqLMzK9qlmIVzvAOgB4WPPfF2CgWAoBu4Rz3bE/DOA0lGRq9oGgWlNwBNDXhQRcOj2f9ml561oaV1y1OX/bT0gNJKMwQQAEYYRmCACH2ymSW8z4EZv6VJ+kcYK0juu1JHWSpiDVkdf6lI+scNxzgKX0UC7HSu4DexOlqwjaRqTexthpspA8yYR2Voi6lmY0qBvygMe+kRmyppn42SDp1gbLwCVfx9m8Qk7EFqkm5+XDuiY6EP8A+9lV3lh/9bwGdy77R2VMV2GWvvLTeDw9R4RHBWU6kGOkScOsxAjbrq29Ty5cREXj9lFTSYgI3MND3HjyjnnCzPQpzTVu5UVx81dD6Rs2OmnRvIRYk2bLFwvneF1kKNw8onYrkq6YWa5q1fH7RJ4TZKoM7dpvQRLCUOESOD2fUZ3HZG74uQ5c4ZRuY2oq7KL0+wRGDkuLOjmZUagPRVpwPZQw9/Dvp9LthsSQhZqpMrRCxABVvgJIqDoSTpar7psmbDTmbXLX+m4+QjivKOmOEedN3k2esSIxHBujH4jYvDBJLssyUpoM9QwWhATPeig0uQSKa0tHS9h9P8LPKJNrInPbK/sVv7Mz2aEigrQkmlIe4ul2uW2CAGul/wC1jGY0whOk0kFUmfC2Vv8AS9vINlPhEGmIJOWUhY/Fu+wi3bRw3WSnl/EpHjuimPtp6BURUtTxGoAibhFu8hknJab49xx+7mPanTKflX7mMfvCVKtKQE8Rc+cRTOzmruT+uEPcNJ+FafmMDrRivKjop9PBZf3/AAZedOm3JyrBJwqjQF284crLG+rHyEYmTqC7BRwWOadWUsF3VhHZZ5NHln3mC8hcwjlUeyviYC5PsJXm1hAuEZrux7hYecEY92yTVWrnty8I0678wjMK/ssv8sEU1R4E+HX71/Jd5MtUXKihVG4AAeQjTE4WXMFJiK4/MAad3CFoI6TmGeG2ZIlnMktVbjSpHcTp4QviJCTFyuqsvBgCPWFYxABHytiYZWzCUteeZh5MSIkYBBAAQQGIba3SXDYcEM4Z6MRLW7MUIDLawNxrT0MY8ATJMRm09uSZIqzrWtAK6k6D++7fFB6Q9O5kxAssdUj0o4OZyQakKNKWArp5xQsdjpkxgCzEE1IZi2YnUsT9KfWEvKXpHjFdzp+1ukE6aKJMSWh94FTvrWptuHnHI+kG0DMmFBMLohorWGY0oWFBpag5d8OMUxMtxLLW7NM1QBvoO63jEERCRoyjLVJ34L1Kq06Yq3PuFYkOj2KErEynOgmJXkpYBj5EwwIpGtYqcp6VwQpYxMywCKEAg6g3BiE2W4mSZUwaPLluO51DelaeUPsVjjKls4lvMYC0uWKsx4D7wo4ni9irqjZfynTwOvzhg2zJgFSopxzD7xz9PxGx8nFO+JkVRwQsllaX1dK5SjMtSb9okX5UAhvifxIxTMXWWg1oHzOACKaVVdb1pCuCKw6icVY6xs/ZS0DMQ3IGorzO+FtotujjvRHE7VxmKadh5zZhTPMenV0sQhRRlNtAACKk1BNY60zs1FmCj0vQEBjvK1Jtyqe8xqSROU5Sd2VDp2MuBnueCqP5nVfrHE2Nbx2n8UptMCycXljzfOP+wxxUwyEYGJ3Yc1Jg6mYaE/8ADY3uaAp3mxG4kU30MERF86JdHSgGJe8xSCJZHsqagk19+xpwI74j1FSMI3f0+Zfpoyc8bd/kJ7F6S4zZzZAQ0pXbNLb2SW3qfaSuoPsk1NDHUOjfTnC4yqk9S40SYyjNQVYodCBTkaXpFTx+x5cztAVDqFIFBXcrX+EEH+WKPi9jTFfKoq1WJAByhQBQ1560+0LQ6lTXmwx+q6dU7SWzPRoijYzZZE+YooFDZqncr3Fu/NHP+j3TvGYXImbrJSLlEtwoAAsMrBcy0pxpy4WzDdNJGJaWz0SaVKOpGVKjtKwYsaizChvVo6JpuOCFO2pEwmGRfzczpGzzxpryhlNxWay1Y8tIBh5mrHIvlHNp5OqV3hfYVmTPicKOFiftGqFfdUk8Wt8/oIzJwg9xGc8aUHmYUnS3Udt5cvlXM0CXZBGNniyfO7NWdhqad1vU39IaTMUNMxPdUnzN40eZKBuXc87CNf2ptJaBRyFTFYxitwkk3l3YZSfcbyP3gjQtN+JvOCG1Q4M0e32R02CCCKnEYgjMBgABDPaO0ZclCznwAJqaEgW7ods1ATHKunu2nM9ZIrlUVYm12qNKa2yjk5PAwsr2walcU2702nzDkljqkNNCC5oakhgaKNAb0pxrQVJ9oqudhSY6mpc1Kgtoam8xqnU0WxIB3xc+XcqKkmmY89aU42+Y5wo6e1LFwFqdDV99DysvCxO+E8FyeWVSsaojMyMxLMcxJMKy5QLltwFO6HGGkezyTnvP9o0xM1UTtEAvbxMdqioxNtgQ6yiAmxuxv30+kQuMmKSKDvPEw5x0zQXNKC+hFDQnnaGD3MRnK+CcpdjQmBYy4jAiYh6G/D/Eibs3DN8KmWeXVuyDzCg+Ii1SEA01O/6Rzf8ABfGZsNNlE+xMDAcFdB/5I3nHRZj0FtYUfsUf8Y8ErYJZlKMkxD/XVPr6RxzDYaZNaXKlrmd2CKOJY0FeA4ncKx2n8UKjZkxmNe3LCjmXWvpU+Ec7/DMgbTwtRWvWAVIFD1TmvPQ25xorOydHdjjCYeXh00Qdpt7u13Y95J9BElOQGgYVFRDltYbYg6d4jBkc1/GdQsmWor2pin+lJo/8hHHDHXfxwmf8qvETWPh1YHzMcjaGQrMRY+j3SiZhiQVExCKEGzC9aht9KsaNXXdFcAjZVJIAuTYd5sIScIyVpLA0Jyi7xZ16fKl4nDqQXVJy55YrlImZT2GrUUJuFFqr4xGY7YrSkV5hEwe/nfKAhbrGNb3BFfDhURY8JhFSWslpmXKoUUJFFAy1HDXW0ZaYW/hTcrNbcKMpNKjiLjnePEVRxuo7XPWqUlNNPexVsds6Q4JntkbISsxFIllc3ZruD8RpwppFT2vgOqKlc+UhiM6gGgbLXs7moSOQjo2MmdSg/aTJKFCXQBizurLlyIx9kAgEnfSOf7TntiJjzHpU0oAbIB7K+VfMmOzppzve+Pt9Dkp9Nq3RbeiOPmS5KZWqqD+ImpAYljQipFL7q2I3xaJu2JYvLlgn4nvFW2NVAjLLrnRGFGALZkqwIN7GgP8AKd8TmxcaksGUZa55fvZQxAJbKtzYgAeYilJqc3F/MavBxgms/IXM/FTbDMRwUFR6RtL2E+rsq+NT6Q7/AG+dMtLls3eaDyFBCi7OxL+3MSWOApX0js8NJb/wjznXktkl82JJs2SgqxJ5mij1jSZj5CWUAnkM3qbQ8TY2GW82aznv+8b/ALxwMr2JYJ8/nCNRXuZ4spYcvolYi/3q26U/oPpBEj/6uXdK+X3gjL+32Msvf+WWuCI8bYk9T12bs6U97N8FPi/zpeKntHpDOmEhTkTcFNz3tr5UjoHL27gakDvIHzjKkG4NRyvHKyKmpueJjaWxU1UlTxUkHzEYB0PbONWVKeY5oqKWOuiiu4GOGYjFmZOaa1as5ZampAAOUEmpIv8A7aXra07a6SzWlPJfthgFzGzUzDNWntilajWKiGYZVN8tV07yaEGguTffSMXmlpLwh5dXuGGTKWI1GUg60vl9A/hQQS0AcWtof87o3wj5mdTYhGpzqtQfAiEGxH8RR8Rse/dHYlFK5pJCo7soA1rrv47vWIfaE9Gcqadm9xpS5Pl84lsS1BELMACF3AGclBXeu891qQVODJ8CS5ZiGm+oUfm3eWsRYW8WDZ+FqxIsAKAncOPfEZtOQEmGlcrdpSd9dfWsQnTelSJyWLjFhGohQxrSJCHRvwXxWXFzJe6ZKJ/mlutPR38o7Iy3jz10Bx3U4/DOTQGYEPdMBl35dsHwj0awgNTOYfjPjDkwsgaMzzD/ACBUX/8ARvKOYyMW8mZLmyzR5bq6nmt78joRvBMdC/GP/mMP/wDG/wD3/wCI5xNWojAPSux9ppisPLnp7MxQ1PhOjKeasCDzEK4jTxjnH4L7TLSZ+FJ9hxMXkkwEMB3Mlf546RPHZgNRxn8Z8XmxsuWNJclT4uzk+gWOctFp/EXEdZtHEGtQrKg/klopHmDFWMaKAiV6NYfrMXIUioDq57k7RqdwOWnjEWIkNjzCkwTBU5QdDTVTv3DieELUTcXbgpSScop8o6/i8FLmENMVCVaq1NKMDqL7iSPLwVxGFBAdioZLoaA5bZRS9zoedYq+G6QOlQ6BlBVQFBzCq1BZW17yF7NTwrPYeYj1KMTmrqoUCoIJNrLpxru4x4cqc477HvWyyl4gvMmOxdnYh0NaFgQTlAUagZfdtfdWI5cIqB3AIZhTxY0H65RKz8P/ABXrf+I5tp2wT5XhhiCwQiu4kCumUNpW2tPOPSo5aS9gqU9EHJ9k7Fs6OuDKl1PspMWpvQB6U/pHyh7gZ7JNJooExa1oDlKUGlbVB/2xUOj+3SjGUy1GYMrqrHLU0YGmqdomu7uNrDtWYjrLmgq1Jimvs0VqrUmtDQE0405xBxlTr3WLtnK1GrQt7E7N2q495j4gfKGU/aEw76frjDVgYwxju0927nkaILZIw7s2pMakRmsaloYawZYIM0Ebc3SL7o1rBBDkyw4TopOdQzuqVuBTOfGhA9TDPbGwZshDNJVkGpFiK2FVP0JgggAo85rljxIHeBX/AMl4a8ojlNM1tDWo/NQEa8af1HhBBEqT/UZ6TS8BCeDWs8EXPaqONLEVPIg+FIb4gAEErXq6kCtKj6GoEZgjuWxyPYcYLEiah6wDLyzX398E6kw5igKr7ANKUFLnfU8KboIIeGUrg9kOEFFANySKjQCu83v3RHbTkkyy5uysb29m/wBgaRmCGqelishYwRBBHASFZDEEEGhFweBGhj1DsrGCfJlThpMlo/8AWob6wQQIDmv4zSu1hX5TFPmhHyMc0ggjBizfhhjDK2nLXdNWZLPivWA+csDxjuxFoIIDDy/tefnnTX+OZMf+t2b6wxpBBAYZpEps6WAoLA0LA2NzUlabuHGMQRvZj0/UizqmVQBROyrBaBiMuq0spoMoBJN77hCxDyaFHNUNaZmPZJzVcnUsCxNBaoG6sEEedI+mjFWZrMn5i01qqWZSRY9pgopbdUxB4pqg9kkgAC4AFXANeNqQQR0dMvMT61/oL5DXBvlm760AKLShBal60BFDWnECLRhBVJkp8pBUsqAGgVPaBaxIIItuJNIIIzqfWcfR5pu5NylQhSXqSB7p3jwh1LwqnQO3iiwQQ98HkVJ6ZOwv+wndJX+ZyflCU3sf9Je5WP0ggje5GPVVOzEP20/9T/YPtBBBGnR49Tk//9k=')),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'The Milie and slow show',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                            child: Text(
                          'The show is about a interesting boy with lots of knowledgeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',
                          style: TextStyle(color: Colors.grey, fontSize: 12.5),
                          overflow: TextOverflow.ellipsis,
                        )),
                        Text(
                          'number of episodes : ' + '${3}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.white,
                    ),
                    radius: 12,
                    backgroundColor: Color.fromARGB(255, 224, 148, 238),
                  )
                ],
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Hosted by Artists',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
                      width: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 179, 178, 178),
                                  blurRadius: 5)
                            ],
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'data:image/jpeg;base64,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'))),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Positioned(
                                right: 15,
                                bottom: -15,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Color.fromARGB(255, 167, 65, 185),
                                  child: Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )),
                            Positioned(
                                left: 15,
                                bottom: -45,
                                child: Column(
                                  children: const [
                                    Text('Burna boy',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text('On The Low'),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    );
                  })),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Recently played',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 170,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 50),
                      width: 112,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 179, 178, 178),
                                  blurRadius: 5)
                            ],
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'data:image/jpeg;base64,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'))),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Positioned(
                                right: 1,
                                bottom: -15,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 167, 65, 185),
                                  child: Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                )),
                            Positioned(
                                left: 15,
                                bottom: -55,
                                child: Column(
                                  children: const [
                                    Text('Burna boy',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 241, 200, 186))),
                                    Text('On The Low'),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
