import { Button } from 'flowbite-react';

export default function CallToAction() {
  return (
    <div className='flex flex-col sm:flex-row p-3 border border-teal-500 justify-center items-center rounded-tl-3xl rounded-br-3xl text-center'>
        <div className="flex-1 justify-center flex flex-col">
            <h2 className='text-2xl'>
                Want to join us and save more cats?
            </h2>
            <p className='text-gray-500 my-2'>
                Checkout how to be one of our contributors
            </p>
            <Button gradientDuoTone='redToYellow' className='rounded-tl-xl'>
                <a href="https://www.100jsprojects.com" target='_blank' rel='noopener noreferrer'>
                    Join Today
                </a>
            </Button>
        </div>
        <div className="p-7 flex-1">
            <img src="https://www.universityofcalifornia.edu/sites/default/files/styles/article_default_banner/public/cat-and-woman.jpg?h=75334513&itok=T3CYE5ZV" />
        </div>
    </div>
  )
}