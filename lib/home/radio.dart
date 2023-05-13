import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 21,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Radio',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold, fontSize: 24),
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
                children: [
                  Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.purple,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Add to your favourite radio playlist',
                    style: GoogleFonts.acme(fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'New Radio playlist',
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.bold),
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
                children:  [
                  ClipRRect(
                   borderRadius: BorderRadius.circular(35),
                    child: const  Image(
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
                      children: [
                        Text(
                          'The Milie and slow show',
                          style: GoogleFonts.acme(fontWeight: FontWeight.bold,fontSize: 13),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                            child: Text(
                          'The show is about a interesting boy with lots of knowledge',
                          style: GoogleFonts.inter(color: Colors.grey,fontSize: 12.5),
                        )),
                        Text(
                          'number of episodes : ' + '${3}',
                          style: GoogleFonts.inter(fontSize: 13,fontWeight: FontWeight.bold),
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
            )
          ],
        ),
      ),
    );
  }
}
