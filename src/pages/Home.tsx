import MainBanner from "../common/MainBanner.tsx";
import banner4 from '../assets/images/banner4.jpg';

function Home() {
    return (
        <>
            <MainBanner />
            <section className="flex flex-col items-center justify-center text-center p-8 bg-color4 text-color-negro rounded-2xl shadow-lg mt-10 w-3/4 mx-auto">
                <h2 className="text-3xl font-bold text-color2 mb-4">About Me</h2>
                <img src={banner4} alt="..."/>
                <h6 className="text-lg text-color3"><strong>Nombre:</strong> Adrian Anchiraico</h6>
                <h5 className="text-lg text-color2"><strong>Edad:</strong> 19 años</h5>
                <h4 className="text-lg text-color2"><strong>Carrera:</strong> Desarrollo de Videojuegos</h4>
            </section>
        </>
    );
}

export default Home;